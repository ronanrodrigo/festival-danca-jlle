import Foundation
import FBSDKLoginKit
import FestivalDancaJlleCore

class LoginGatewayFacebook: LoginGateway {
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func login(successHandler: (token: String, userID: String) -> (), errorHandler: (error: NSError) -> (), cancelHandler: () -> ()) {
        FBSDKLoginManager().logInWithReadPermissions(["user_events", "user_friends", "public_profile"], fromViewController: viewController,
            handler: { (result: FBSDKLoginManagerLoginResult?, error: NSError?) in
                if let error = error {
                    FBSDKLoginManager().logOut()
                    errorHandler(error: error)
                }
                guard let result = result else { return }
                if result.isCancelled {
                    FBSDKLoginManager().logOut()
                    cancelHandler()
                } else {
                    let token = result.token.tokenString
                    let userID = result.token.userID
                    successHandler(token: token, userID: userID)
                }
            })
    }

}
