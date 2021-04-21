import SwiftUI

struct BiometryView: View {
    // MARK: - Variables
    @ObservedObject private(set) var viewModel: BiometryViewModel
    @State var isFirstAppear: Bool = true

    // MARK: - Methods
    init(viewModel: BiometryViewModel = BiometryViewModel()) {
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
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 24) {
                Text("Biometry Login").foregroundColor(.black)
                Button(
                    action: {
                        viewModel.send(event: .login)
                    },
                    label: {
                        Text("Login").foregroundColor(.blue)
                    }
                )
            }
        }
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}
