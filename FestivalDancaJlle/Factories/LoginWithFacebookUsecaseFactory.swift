import Foundation
import FestivalDancaJlleCore

class LoginWithFacebookUsecaseFactory {
    static func make(viewController: UIViewController, presenter: LoginWithFacebookPresenter) ->
            LoginWithFacebookUsecase {
        let gateway = FacebookLoginGatewayAPI(viewController: viewController)
        return LoginWithFacebookUsecase(
            facebookLoginGateway: gateway,
            loginWithFacebookPresenter: presenter
        )
    }
}
