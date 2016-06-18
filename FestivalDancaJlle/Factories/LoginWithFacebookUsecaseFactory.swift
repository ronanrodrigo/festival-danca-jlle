import Foundation
import FestivalDancaJlleCore

class LoginWithFacebookUsecaseFactory {

    static func make(viewController: UIViewController, presenter: LoginWithFacebookPresenter) ->
            LoginWithFacebookUsecase {
        let gateway = LoginGatewayFacebook(viewController: viewController)
        return LoginWithFacebookUsecase(
            facebookLoginGateway: gateway,
            loginWithFacebookPresenter: presenter
        )
    }

}
