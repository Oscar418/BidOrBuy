import UIKit
import Foundation

var activityView = UIActivityIndicatorView(style: .whiteLarge)

extension UIViewController {
    
    func showBusyView() {
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityView.center = self.view.center
        activityView.color = .orange
        activityView.startAnimating()
        self.view.addSubview(activityView)
    }
    
    func hideBusyView() {
        UIApplication.shared.endIgnoringInteractionEvents()
        activityView.stopAnimating()
        activityView.isHidden = true
        activityView.removeFromSuperview()
    }
}
