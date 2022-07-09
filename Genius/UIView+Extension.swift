import UIKit

extension UIView {
    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.3) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
}
