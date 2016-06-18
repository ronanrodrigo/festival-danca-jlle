import Foundation
import FBSDKLoginKit
import FestivalDancaJlleCore

class ListEventsUsecaseFactory {

    static func make(listEventsPresenter: ListEventsPresenter) -> ListEventsUsecase {
        let token = FBSDKAccessToken.currentAccessToken().tokenString
        let eventsGateway = EventsGatewayFacebook(token: token)
        return ListEventsUsecase(
            eventsGateway: eventsGateway,
            listEventsPresenter: listEventsPresenter)
    }

}
