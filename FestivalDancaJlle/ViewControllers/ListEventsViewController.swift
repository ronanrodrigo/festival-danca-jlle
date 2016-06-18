import UIKit
import FestivalDancaJlleCore

class ListEventsViewController: UIViewController, LoginWithFacebookPresenter {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var loginButtonBottom: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Actions

    @IBAction func didTappedAtLogin(sender: AnyObject) {
        LoginWithFacebookUsecaseFactory.make(self, presenter: self).login()
    }

    // MARK: LoginWithFacebookPresenter

    func error(error: NSError) {
        print(error.description)
    }

    func cancel() {
        hideLoginButton()
    }

    func success(token: String, userID: String) {
        hideLoginButton()
    }

    // MARK: Other functions

    private func hideLoginButton() {
        loginButtonBottom.constant = -loginButtonHeight.constant
        UIView.animateWithDuration(
            0.2, delay: 0.0, options: UIViewAnimationOptions.CurveLinear,
            animations: { self.view.layoutIfNeeded() }, completion: nil
        )
    }

}
