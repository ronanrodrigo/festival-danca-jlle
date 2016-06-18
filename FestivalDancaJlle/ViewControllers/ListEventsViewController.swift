import UIKit
import FBSDKLoginKit

class ListEventsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTappedAtLoginButton(sender: AnyObject) {
        let login = FBSDKLoginManager()
        login.logInWithReadPermissions([""], fromViewController: self,
            handler: { (result: FBSDKLoginManagerLoginResult?, error: NSError?) in
                if error != nil {
                    print("Process error")
                } else if result!.isCancelled {
                    print("Cancelled")
                } else {
                    print("Logged in")
                }
        })
    }

}
