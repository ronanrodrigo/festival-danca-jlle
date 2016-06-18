import Foundation

public protocol FacebookLoginGateway {
    func login(successHandler: (token: String, userID: Int) -> (), errorHandler: (error: NSError) -> (), cancelHandler: () -> ())
}
