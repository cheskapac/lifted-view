import SwiftUI

extension MBPTextField {
    struct IndicatorView: View {
        private var config: MBPTextField.TFConfig
        private var state: MBPTextField.TFState
        
        init(config: MBPTextField.TFConfig, state: MBPTextField.TFState) {
            self.config = config
            self.state = state
        }

        var body: some View {
            Rectangle()
                .frame(height: config.indicatorHeight)
                .foregroundColor(foregroundColor())
                .padding(
                    EdgeInsets(
                        top: config.height - config.indicatorHeight,
                        leading: config.padding.leading,
                        bottom: 0,
                        trailing: config.padding.trailing
                    )
                )
        }
        
        private func foregroundColor() -> Color {
            switch state {
            case .active:
                return Color.blue
            case .error:
                return Color.red
            case .empty:
                return .clear
            case .default:
                return .clear
            }
        }
    }
}
