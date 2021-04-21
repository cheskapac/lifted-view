import Combine

class AppRootViewModel: ObservableObject {
    static let shared = AppRootViewModel()
    
    // MARK: - Variables
    @Published var rootContent: RootContent
    private var cancelBag = Set<AnyCancellable>()

    // MARK: - Methods
    init(rootContent: RootContent = .biometry) {
        self.rootContent = rootContent
    }
}
