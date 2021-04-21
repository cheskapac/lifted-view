import UIKit

class PaddedTextField: UITextField {
    // MARK: - Variables
    private let padding: UIEdgeInsets
    private let clearButtonImage: UIImage?
    
    // MARK: - Methods
    init(padding: UIEdgeInsets, clearButtonImage: UIImage?) {
        self.padding = padding
        self.clearButtonImage = clearButtonImage
        super.init(frame: .zero)
        setupClearButton(clearButtonImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding).inset(
            by: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: clearButtonRect(forBounds: bounds).width + 8)
        )
    }
    
    // MARK: - Clear button
    private func setupClearButton(_ image: UIImage?) {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didTouchUpInsideClearButton), for: .touchUpInside)
        rightView = button
        clearButtonMode = .never
    }
    
    @objc private func didTouchUpInsideClearButton(sender: UIButton) {
        text = ""
    }
}
