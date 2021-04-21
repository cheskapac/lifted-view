import SwiftUI

struct AppRootView: View {
    @ObservedObject var viewModel: AppRootViewModel
    
    init(viewModel: AppRootViewModel = .shared) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        switch viewModel.rootContent {
        case .login:
            LoginView()
        case .biometry:
            BiometryView()
        case .dashboard:
            DashboardView()
        }
    }
}

struct AppRootView_Previews: PreviewProvider {
    static var previews: some View {
        AppRootView(viewModel: AppRootViewModel())
    }
}
