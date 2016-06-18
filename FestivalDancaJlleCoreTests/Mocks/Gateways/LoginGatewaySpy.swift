import Foundation

class LoginGatewaySpy: LoginGateway {
    var loginSpied = false
    var shouldSuccessed = true
    var shouldError = false
    var shouldCancel = false

    func login(successHandler: (token: String, userID: String) -> (), errorHandler: (error: NSError) -> (), cancelHandler: () -> ()) {
        if shouldSuccessed {
            successHandler(token: "", userID: "")
        } else if shouldError {
            errorHandler(error: NSError(domain: "", code: 0, userInfo: nil))
        } else if shouldCancel {
            cancelHandler()
        }
        loginSpied = true
    }

}
