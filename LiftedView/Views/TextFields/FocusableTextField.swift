import SwiftUI

struct FocusableTextField: UIViewRepresentable {
    // MARK: - Variables
    @Binding var text: String
    @Binding var isResponder: Bool
    private var hasError: Bool
    private var padding: UIEdgeInsets
    private var clearButtonImage: UIImage?
    private var font: UIFont?
    private var foregroundNormalColor: UIColor?
    private var foregroundErrorColor: UIColor?
    private var accentColor: UIColor?
    private var textAlignment: NSTextAlignment?
    private var contentType: UITextContentType?
    private var autocorrection: UITextAutocorrectionType = .default
    private var autocapitalization: UITextAutocapitalizationType = .sentences
    private var keyboardType: UIKeyboardType = .default
    private var returnKeyType: UIReturnKeyType = .default
    private var isSecure: Bool = false
    private var isUserInteractionEnabled: Bool = true
    private var clearsOnBeginEditing: Bool = false
    @Environment(\.layoutDirection) private var layoutDirection: LayoutDirection

    init(text: Binding<String>,
         isResponder: Binding<Bool>,
         hasError: Bool,
         padding: UIEdgeInsets,
         clearButtonImage: UIImage?) {
        self._text = text
        self._isResponder = isResponder
        self.hasError = hasError
        self.padding = padding
        self.clearButtonImage = clearButtonImage
     }
    
    func makeCoordinator() -> FocusableTextField.Coordinator {
        return Coordinator(text: $text, isResponder: $isResponder)
    }

    func makeUIView(context: UIViewRepresentableContext<FocusableTextField>) -> PaddedTextField {
        let textField = PaddedTextField(padding: padding, clearButtonImage: clearButtonImage)
        textField.delegate = context.coordinator
        textField.font = font
        textField.textColor = hasError ? foregroundErrorColor : foregroundNormalColor
        if let textAlignment = textAlignment {
            textField.textAlignment = textAlignment
        }
        if let contentType = contentType {
            textField.textContentType = contentType
        }
        if let accentColor = accentColor {
            textField.tintColor = accentColor
        }
        textField.autocorrectionType = autocorrection
        textField.autocapitalizationType = autocapitalization
        textField.keyboardType = keyboardType
        textField.returnKeyType = returnKeyType
        textField.clearsOnBeginEditing = clearsOnBeginEditing
        textField.isSecureTextEntry = isSecure
        textField.isUserInteractionEnabled = isUserInteractionEnabled
        textField.setContentHuggingPriority(.defaultHigh, for: .vertical)
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textField.rightViewMode = .never
        textField.rightView?.tintColor = foregroundNormalColor
        return textField
    }

    func updateUIView(_ uiView: PaddedTextField, context: UIViewRepresentableContext<FocusableTextField>) {
        uiView.text = text
        uiView.textColor = hasError ? foregroundErrorColor : foregroundNormalColor
    }
}

extension FocusableTextField {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var isResponder: Bool

        init(text: Binding<String>, isResponder: Binding<Bool>) {
            _text = text
            _isResponder = isResponder
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
            if text.isEmpty {
                textField.rightViewMode = .never
            } else {
                textField.rightViewMode = .whileEditing
            }
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            isResponder = true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            isResponder = false
        }
    }
}

extension FocusableTextField {
    func font(_ font: UIFont?) -> FocusableTextField {
        var view = self
        view.font = font
        return view
    }

    func foregroundNormalColor(_ color: UIColor?) -> FocusableTextField {
        var view = self
        view.foregroundNormalColor = color
        return view
    }

    func foregroundErrorColor(_ color: UIColor?) -> FocusableTextField {
        var view = self
        view.foregroundErrorColor = color
        return view
    }

    func accentColor(_ color: UIColor?) -> FocusableTextField {
        var view = self
        view.accentColor = color
        return view
    }

    func textAlignment(_ alignment: NSTextAlignment) -> FocusableTextField {
        var view = self
        view.textAlignment = alignment
        return view
    }

    func textContentType(_ type: UITextContentType?) -> FocusableTextField {
        var view = self
        view.contentType = type
        return view
    }

    func autocorrection(_ type: UITextAutocorrectionType) -> FocusableTextField {
        var view = self
        view.autocorrection = type
        return view
    }

    func textAutocapitalizationType(_ style: UITextAutocapitalizationType) -> FocusableTextField {
        var view = self
        view.autocapitalization = style
        return view
    }

    func keyboardType(_ type: UIKeyboardType) -> FocusableTextField {
        var view = self
        view.keyboardType = type
        return view
    }

    func returnKeyType(_ type: UIReturnKeyType) -> FocusableTextField {
        var view = self
        view.returnKeyType = type
        return view
    }

    func isSecure(_ isSecure: Bool) -> FocusableTextField {
        var view = self
        view.isSecure = isSecure
        return view
    }

    func clearsOnBeginEditing(_ shouldClear: Bool) -> FocusableTextField {
        var view = self
        view.clearsOnBeginEditing = shouldClear
        return view
    }

    func isUserInteractionEnabled(_ isEnabled: Bool) -> FocusableTextField {
        var view = self
        view.isUserInteractionEnabled = isEnabled
        return view
    }
}
