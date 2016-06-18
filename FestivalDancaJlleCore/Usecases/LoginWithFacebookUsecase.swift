import Foundation

public struct LoginWithFacebookUsecase {
    var facebookLoginGateway: FacebookLoginGateway
    var loginWithFacebookPresenter: LoginWithFacebookPresenter

    public init(facebookLoginGateway: FacebookLoginGateway, loginWithFacebookPresenter: LoginWithFacebookPresenter) {
        self.facebookLoginGateway = facebookLoginGateway
        self.loginWithFacebookPresenter = loginWithFacebookPresenter
    }

    public func login() {
        facebookLoginGateway.login({token, userID in
            self.loginWithFacebookPresenter.success(token, userID: userID)
        }, errorHandler: {error in
            self.loginWithFacebookPresenter.error(error)
        }, cancelHandler: {
            self.loginWithFacebookPresenter.cancel()
        })
    }
}
