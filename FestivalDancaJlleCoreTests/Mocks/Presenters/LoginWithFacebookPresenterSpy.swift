import Foundation

class LoginWithFacebookPresenterSpy: LoginWithFacebookPresenter {
    var errorSpied = false
    var cancelSpied = false
    var successSpied = false

    func error(error: NSError) {
        errorSpied = true
    }

    func cancel() {
        cancelSpied = true
    }

    func success(token: String, userID: String) {
        successSpied = true
    }

}
