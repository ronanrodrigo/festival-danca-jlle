import Foundation

public protocol FacebookLoginGateway {
    func login(successHandler: (token: String, userID: String) -> (), errorHandler: (error: NSError) -> (), cancelHandler: () -> ())
}
