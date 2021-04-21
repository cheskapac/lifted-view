import SwiftUI

struct LoginView: View {
    // MARK: - Variables
    @ObservedObject private(set) var viewModel: LoginViewModel
    @State var isFirstAppear: Bool = true
    @State var username = ""
    @State var code = ""

    // MARK: - Methods
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
    }
    
    private func onAppear() {
        guard isFirstAppear else {
            return
        }
        isFirstAppear.toggle()
        viewModel.send(event: .appear)
    }
    
    private func onDisappear() {
        isFirstAppear = true
    }

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 24) {
                Text("Login").foregroundColor(Color.black)
                MBPTextField(title: "Username", value: $username, hasError: false)
                MBPTextField(title: "Code", value: $code, hasError: false)
                Button(
                    action: {
                        viewModel.send(event: .submit)
                    },
                    label: {
                        Text("Submit")
                    }
                )
            }
        }
    }
}
