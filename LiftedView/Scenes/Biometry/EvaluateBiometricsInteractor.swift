import Combine
import LocalAuthentication

protocol EvaluateBiometricsInteracting {
    func request(reason: String) -> AnyPublisher<Bool, Never>
}

class EvaluateBiometricsInteractor: EvaluateBiometricsInteracting {
    // MARK: - Variables
    private let context: LAContext

    // MARK: - Methods
    init() {
        context = LAContext()
        context.localizedFallbackTitle = ""
    }

    func request(reason: String) -> AnyPublisher<Bool, Never> {
        return Future { [weak self] (promise) in
            guard let context = self?.context else {
                promise(.success(false))
                return
            }
            let policy: LAPolicy = .deviceOwnerAuthenticationWithBiometrics
            context.evaluatePolicy(policy, localizedReason: reason) { (success, error) in
                promise(.success(success))
            }
        }.eraseToAnyPublisher()
    }
}
