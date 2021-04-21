import Combine

extension LoginViewModel {
    enum VMEvent {
        case appear
        case username(String)
        case code(String)
        case submit
    }
}

class LoginViewModel: ObservableObject {
    private var username: String = ""
    private var code: String = ""

    func send(event: VMEvent) {
        switch event {
        case .appear:
            handleAppearEvent(event)
        case .username:
            handleUsernameEvent(event)
        case .code:
            handleCodeEvent(event)
        case .submit:
            handleSubmitEvent(event)
        }
    }

    private func handleAppearEvent(_ event: VMEvent) {
        guard case .appear = event else {
            return
        }
        print("appear")
    }
    
    private func handleUsernameEvent(_ event: VMEvent) {
        guard case .username(let username) = event else {
            return
        }
        self.username = username
    }
    
    private func handleCodeEvent(_ event: VMEvent) {
        guard case .code(let code) = event else {
            return
        }
        self.code = code
    }
    
    private func handleSubmitEvent(_ event: VMEvent) {
        guard case .submit = event else {
            return
        }
        AppRootViewModel.shared.rootContent = .biometry
    }
}
