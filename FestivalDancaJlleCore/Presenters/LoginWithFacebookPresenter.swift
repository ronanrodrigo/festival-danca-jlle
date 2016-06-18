import Foundation

public protocol LoginWithFacebookPresenter {
    func error(error: NSError)
    func cancel()
    func success(token: String, userID: Int)
}
