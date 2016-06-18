import UIKit
import FestivalDancaJlleCore

class ListEventsViewController: UIViewController, LoginWithFacebookPresenter {

    @IBOutlet weak var loginButton: UIButton!

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
        loginButton.hidden = true
    }

}
