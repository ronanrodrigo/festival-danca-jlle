import Foundation

public protocol EventsGateway {
    func list(successHandler: (events: [Event]) -> (), errorHandler: (error: NSError) -> ())
}
