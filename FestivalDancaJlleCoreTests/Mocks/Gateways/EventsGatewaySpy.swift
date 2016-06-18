import Foundation

class EventsGatewaySpy: EventsGateway {
    var listSpied = false
    var shouldSuccessed = true

    func list(successHandler: (events: [Event]) -> (), errorHandler: (error: NSError) -> ()) {
        if shouldSuccessed {
            successHandler(events: [EventStruct()])
        } else {
            errorHandler(error: NSError(domain: "", code: 0, userInfo: nil))
        }
        listSpied = true
    }
}
