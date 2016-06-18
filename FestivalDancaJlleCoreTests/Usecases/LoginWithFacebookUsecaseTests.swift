import Foundation
import XCTest

class LoginWithFacebookUsecaseTests: XCTestCase {

    var loginWithFacebookUsecase: LoginWithFacebookUsecase!
    var facebookLoginGatewaySpy: FacebookLoginGatewaySpy!
    var loginWithFacebookPresenterSpy: LoginWithFacebookPresenterSpy!

    override func setUp() {
        facebookLoginGatewaySpy = FacebookLoginGatewaySpy()
        loginWithFacebookPresenterSpy = LoginWithFacebookPresenterSpy()
        loginWithFacebookUsecase = LoginWithFacebookUsecase(
            facebookLoginGateway: facebookLoginGatewaySpy,
            loginWithFacebookPresenter: loginWithFacebookPresenterSpy
        )
    }

    func testShouldLoginWithSuccess() {
        loginWithFacebookUsecase.login()

        XCTAssertTrue(facebookLoginGatewaySpy.loginSpied)
        XCTAssertTrue(loginWithFacebookPresenterSpy.successSpied)
        XCTAssertFalse(loginWithFacebookPresenterSpy.errorSpied)
        XCTAssertFalse(loginWithFacebookPresenterSpy.cancelSpied)
    }

    func testShouldGetErrorWhenErrorOccour() {
        facebookLoginGatewaySpy.shouldSuccessed = false
        facebookLoginGatewaySpy.shouldCancel = false
        facebookLoginGatewaySpy.shouldError = true

        loginWithFacebookUsecase.login()

        XCTAssertTrue(facebookLoginGatewaySpy.loginSpied)
        XCTAssertTrue(loginWithFacebookPresenterSpy.errorSpied)
        XCTAssertFalse(loginWithFacebookPresenterSpy.successSpied)
        XCTAssertFalse(loginWithFacebookPresenterSpy.cancelSpied)
    }

    func testShouldCancelWhenWasCanceled() {
        facebookLoginGatewaySpy.shouldSuccessed = false
        facebookLoginGatewaySpy.shouldError = false
        facebookLoginGatewaySpy.shouldCancel = true

        loginWithFacebookUsecase.login()

        XCTAssertTrue(facebookLoginGatewaySpy.loginSpied)
        XCTAssertTrue(loginWithFacebookPresenterSpy.cancelSpied)
        XCTAssertFalse(loginWithFacebookPresenterSpy.successSpied)
        XCTAssertFalse(loginWithFacebookPresenterSpy.errorSpied)
    }

}
