import Combine
import Auth
import WalletConnectPairing

final class WalletInteractor {

    func pair(uri: WalletConnectURI) async throws {
        try await Pair.instance.pair(uri: uri)
    }

    var requestPublisher: AnyPublisher<AuthRequest, Never> {
        return Auth.instance.authRequestPublisher
    }
}
