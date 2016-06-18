import Foundation

public protocol LoginGateway {
    func login(successHandler: (token: String, userID: String) -> (), errorHandler: (error: NSError) -> (), cancelHandler: () -> ())
}
