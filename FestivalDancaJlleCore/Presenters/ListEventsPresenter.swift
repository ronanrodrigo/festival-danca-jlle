import Foundation

public protocol ListEventsPresenter {
    func success(events: [Event])
    func error(error: NSError)
}
