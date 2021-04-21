import SwiftUI

public struct MBPTextField: View {
    // MARK: - Variables
    @State private(set) var isResponder: Bool = false
    private var title: String
    @Binding private(set) var value: String
    private(set) var hasError: Bool
    private let textContentType: UITextContentType?
    private let textAutocapitalizationType: UITextAutocapitalizationType
    private let keyboardType: UIKeyboardType
    private let config: TFConfig

    // MARK: - Methods
    public init(title: String,
                value: Binding<String>,
                hasError: Bool,
                textContentType: UITextContentType? = nil,
                textAutocapitalizationType: UITextAutocapitalizationType = .none,
                keyboardType: UIKeyboardType = .default,
                config: TFConfig = TFConfig()) {
        self.title = title
        self._value = value
        self.hasError = hasError
        self.textContentType = textContentType
        self.textAutocapitalizationType = textAutocapitalizationType
        self.keyboardType = keyboardType
        self.config = config
    }
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Rectangle()
                .fill(Color.white)
                .frame(height: config.height)
                .cornerRadius(10)
            TitleAndPlaceholder(title, config: config, state: state)
            IndicatorView(config: config, state: state)
            textField()
        }
        .frame(height: config.height)
        .clipped()
    }
        
    private func textField() -> some View {
        FocusableTextField(
            text: $value,
            isResponder: $isResponder,
            hasError: hasError,
            padding: UIEdgeInsets(top: config.textFieldOffset, left: 0, bottom: 0, right: 0),
            clearButtonImage: UIImage(systemName: "xmark.circle")
        )
        .font(UIFont.systemFont(ofSize: 12))
        .foregroundNormalColor(UIColor.black)
        .foregroundErrorColor(UIColor.red)
        .textContentType(textContentType)
        .textAutocapitalizationType(textAutocapitalizationType)
        .keyboardType(keyboardType)
        .frame(height: config.height)
        .contentShape(Rectangle())
        .padding(config.padding)
        .background(Color.clear)
    }
    
    private func shouldShowPlaceholder() -> Bool {
        return !isResponder && value.isEmpty
    }
}

struct MBPFieldTextPreview: PreviewProvider {
    static var previews: some View {
        return ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack {
                Text("without errors")
                    .foregroundColor(.black)
                MBPTextField(
                    title: "Title",
                    value: .constant(""),
                    hasError: false
                )
                MBPTextField(
                    title: "Title",
                    value: .constant("value"),
                    hasError: false
                )
                Text("with errors")
                    .foregroundColor(.black)
                    .padding(.top, 32)
                MBPTextField(
                    title: "Title",
                    value: .constant(""),
                    hasError: true
                )
                MBPTextField(
                    title: "Title",
                    value: .constant("value"),
                    hasError: true
                )
            }.padding(16)
        }
        .preferredColorScheme(.dark)
    }
}
