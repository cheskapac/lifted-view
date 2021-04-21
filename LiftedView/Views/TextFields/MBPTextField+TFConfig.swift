import SwiftUI

extension MBPTextField {
    public struct TFConfig {
        let height: CGFloat
        let indicatorHeight: CGFloat
        let padding: EdgeInsets
        let placeholderOffset: CGFloat
        let titleOffset: CGFloat
        let textFieldOffset: CGFloat
        let titleAnimationDuration: Double

        public init(height: CGFloat = 56,
                    indicatorHeight: CGFloat = 1,
                    padding: EdgeInsets = EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16),
                    placeholderOffset: CGFloat = 20,
                    titleOffset: CGFloat = 9,
                    textFieldOffset: CGFloat = 25,
                    titleAnimationDuration: Double = 0.15) {
            self.height = height
            self.indicatorHeight = indicatorHeight
            self.padding = padding
            self.placeholderOffset = placeholderOffset
            self.titleOffset = titleOffset
            self.textFieldOffset = textFieldOffset
            self.titleAnimationDuration = titleAnimationDuration
        }
    }
}
