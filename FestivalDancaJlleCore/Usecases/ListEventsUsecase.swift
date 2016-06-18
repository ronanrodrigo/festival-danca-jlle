import Foundation

public struct ListEventsUsecase {
    var eventsGateway: EventsGateway
    var listEventsPresenter: ListEventsPresenter

    public init(eventsGateway: EventsGateway, listEventsPresenter: ListEventsPresenter) {
        self.eventsGateway = eventsGateway
        self.listEventsPresenter = listEventsPresenter
    }

    public func list() {
        eventsGateway.list({ (events: [Event]) in
            self.listEventsPresenter.success(events)
        }, errorHandler: {(error: NSError) in
            self.listEventsPresenter.error(error)
        })
    }
}
