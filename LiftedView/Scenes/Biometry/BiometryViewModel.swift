import Combine

extension BiometryViewModel {
    enum VMEvent {
        case appear
        case login
    }
}

class BiometryViewModel: ObservableObject {
    private let evaluateBiometricsInteractor: EvaluateBiometricsInteracting
    private var cancelBag = Set<AnyCancellable>()
    private var username: String = ""
    private var code: String = ""
    
    init(evaluateBiometricsInteractor: EvaluateBiometricsInteracting = EvaluateBiometricsInteractor()) {
        self.evaluateBiometricsInteractor = evaluateBiometricsInteractor
    }

    func send(event: VMEvent) {
        switch event {
        case .appear:
            handleAppearEvent(event)
        case .login:
            handleLoginEvent(event)
        }
    }

    private func handleAppearEvent(_ event: VMEvent) {
        guard case .appear = event else {
            return
        }
        evaluateBiometricsInteractor.request(reason: "Login to app")
            .sink(receiveValue: { (success) in
                guard success else {
                    return
                }
                AppRootViewModel.shared.rootContent = .dashboard
            })
            .store(in: &cancelBag)
    }
    
    private func handleLoginEvent(_ event: VMEvent) {
        guard case .login = event else {
            return
        }
        AppRootViewModel.shared.rootContent = .login
    }
}
