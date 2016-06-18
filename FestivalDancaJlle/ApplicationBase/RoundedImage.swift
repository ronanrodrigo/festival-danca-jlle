import UIKit

@IBDesignable class RoundedImage: UIImageView {

    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            configureView()
        }
    }

    override class func layerClass() -> AnyClass {
        return CAGradientLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        configureView()
    }

    private func configureView() {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        setNeedsDisplay()
    }

}
