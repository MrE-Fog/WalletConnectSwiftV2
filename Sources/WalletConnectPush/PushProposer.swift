import Foundation
import Combine
import JSONRPC
import WalletConnectUtils
import WalletConnectKMS
import WalletConnectNetworking

class PushProposer {
    private let networkingInteractor: NetworkInteracting
    private let kms: KeyManagementServiceProtocol
    private let logger: ConsoleLogging

    init(networkingInteractor: NetworkInteracting,
         kms: KeyManagementServiceProtocol,
         logger: ConsoleLogging) {
        self.networkingInteractor = networkingInteractor
        self.kms = kms
        self.logger = logger
    }

    func request(topic: String, params: PushRequestParams) async throws {
        logger.debug("Sending Push Proposal")
        let protocolMethod = PushProposeProtocolMethod()
        let request = RPCRequest(method: protocolMethod.method, params: params)
        try await networkingInteractor.requestNetworkAck(request, topic: topic, protocolMethod: protocolMethod)
    }
}
