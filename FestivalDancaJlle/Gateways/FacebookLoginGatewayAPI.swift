import Foundation
import FBSDKLoginKit
import FestivalDancaJlleCore

class FacebookLoginGatewayAPI: FacebookLoginGateway {
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func login(successHandler: (token: String, userID: String) -> (), errorHandler: (error:NSError) -> (), cancelHandler: () -> ()) {
        FBSDKLoginManager().logInWithReadPermissions([""], fromViewController: viewController, handler:
            { (result: FBSDKLoginManagerLoginResult?, error: NSError?) in
                if let _error = error {
                    FBSDKLoginManager().logOut()
                    errorHandler(error: _error)
                }
                guard let _result = result else { return }
                if _result.isCancelled {
                    FBSDKLoginManager().logOut()
                    cancelHandler()
                } else {
                    let token = _result.token.tokenString
                    let userID = _result.token.userID
                    successHandler(token: token, userID: userID)
                }
            })
    }

}
