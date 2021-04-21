import SwiftUI

extension MBPTextField {
    struct TitleAndPlaceholder: View {
        private var content: String
        private var config: MBPTextField.TFConfig
        private var state: MBPTextField.TFState

        init(_ content: String, config: MBPTextField.TFConfig, state: MBPTextField.TFState) {
            self.content = content
            self.config = config
            self.state = state
        }

        var body: some View {
            HStack {
                Text(content)
                    .padding(config.padding)
                    .animatableFont(name: font().fontName, size: font().pointSize)
                    .foregroundColor(foregroundColor())
                    .offset(y: offset())
                    .animation(.easeIn(duration: config.titleAnimationDuration), value: state)
                Spacer()
            }
        }
        
        private func font() -> UIFont {
            switch state {
            case .active,
                 .error,
                 .default:
                return UIFont.systemFont(ofSize: 12)
            case .empty:
                return UIFont.systemFont(ofSize: 10)
            }
        }

        private func foregroundColor() -> Color {
            switch state {
            case .active:
                return Color.blue
            case .error:
                return Color.red
            case .empty:
                return Color.gray
            case .default:
                return Color.black
            }
        }
        
        private func offset() -> CGFloat {
            switch state {
            case .active,
                 .error,
                 .default:
                return config.titleOffset
            case .empty:
                return config.placeholderOffset
            }
        }
    }
}
