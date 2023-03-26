//
//  MultipeerManager.swift
//  MatchMine
//
//  Created by Fernando Putra on 26/03/23.
//

import MultipeerConnectivity
import os

class MultipeerManager: NSObject, ObservableObject {
    private let serviceType = "mm-service"
    private var peerID: MCPeerID
    
    public let serviceAdvertiser: MCNearbyServiceAdvertiser
    public let serviceBrowser: MCNearbyServiceBrowser
    public let session: MCSession
    
    private let log = Logger()
    
    @Published var availablePeers: [MCPeerID] = []
    @Published var recievedInvite: Bool = false
    @Published var recievedInviteFrom: MCPeerID? = nil
    @Published var paired: Bool = false
    @Published var invitationHandler: ((Bool, MCSession?) -> Void)?
    @Published var receivedResults: UserResults?
    @Published var didRecieved: Bool = false
    
    
    init(username: String) {
        peerID = MCPeerID(displayName: username)
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .none)
        serviceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: serviceType)
        serviceBrowser = MCNearbyServiceBrowser(peer: peerID, serviceType: serviceType)
        super.init()
        
        session.delegate = self
        serviceAdvertiser.delegate = self
        serviceBrowser.delegate = self
        
        serviceAdvertiser.startAdvertisingPeer()
        serviceBrowser.startBrowsingForPeers()
    }
    
    deinit {
        endDiscoverForPeers()
    }
    
    func endDiscoverForPeers() {
        serviceAdvertiser.stopAdvertisingPeer()
        serviceBrowser.stopBrowsingForPeers()
    }
    
    func send(result: UserResults) {
        if !session.connectedPeers.isEmpty {
            log.info("sendResults: \(String(describing: result)) to \(self.session.connectedPeers[0].displayName)")
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(result)
                try session.send(data, toPeers: session.connectedPeers, with: .reliable)
            } catch {
                log.error("Error sending: \(String(describing: error))")
            }
        }
    }
}

extension MultipeerManager: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
        log.error("ServiceAdvertiser didNotStartAdvertisingPeer: \(String(describing: error))")
    }
    
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        log.info("didReceiveInvitationFromPeer \(peerID)")
        
        DispatchQueue.main.async {
            self.recievedInvite = true
            self.recievedInviteFrom = peerID
            self.invitationHandler = invitationHandler
        }
    }
}

extension MultipeerManager: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, didNotStartBrowsingForPeers error: Error) {
        log.error("ServiceBroser didNotStartBrowsingForPeers: \(String(describing: error))")
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        log.info("ServiceBrowser found peer: \(peerID)")
        DispatchQueue.main.async {
            self.availablePeers.append(peerID)
        }
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        log.info("ServiceBrowser lost peer: \(peerID)")
        DispatchQueue.main.async {
            self.availablePeers.removeAll(where: {
                $0 == peerID
            })
        }
    }
}

extension MultipeerManager: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        log.info("peer \(peerID) didChangeState: \(state.rawValue)")
        
        switch state {
        case MCSessionState.notConnected:
            DispatchQueue.main.async {
                self.paired = false
            }
            serviceAdvertiser.startAdvertisingPeer()
            break
        case MCSessionState.connected:
            DispatchQueue.main.async {
                self.paired = true
            }
            serviceAdvertiser.stopAdvertisingPeer()
            break
        default:
            DispatchQueue.main.async {
                self.paired = false
            }
            break
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let decoder = JSONDecoder()
        do {
            let results = try decoder.decode(UserResults.self, from: data)
            log.info("didReceive result \(results.username)")
            DispatchQueue.main.async {
                self.receivedResults = results
                self.didRecieved = true
            }
        } catch {
            log.info("didReceive invalid value \(data.count) bytes")
        }
    }
    
    public func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        log.error("Receiving streams is not supported")
    }
    
    public func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        log.error("Receiving resources is not supported")
    }
    
    public func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        log.error("Receiving resources is not supported")
    }
    
    public func session(_ session: MCSession, didReceiveCertificate certificate: [Any]?, fromPeer peerID: MCPeerID, certificateHandler: @escaping (Bool) -> Void) {
        certificateHandler(true)
    }
}
