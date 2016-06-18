import Foundation
import FBSDKLoginKit
import FestivalDancaJlleCore

class ListEventsUsecaseFactory {

    static func make(listEventsPresenter: ListEventsPresenter) -> ListEventsUsecase {
        let eventsGateway = EventsGatewayFacebook()
        return ListEventsUsecase(
            eventsGateway: eventsGateway,
            listEventsPresenter: listEventsPresenter)
    }

}
