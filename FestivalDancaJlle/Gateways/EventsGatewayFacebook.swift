import Foundation
import FBSDKCoreKit
import FestivalDancaJlleCore

class EventsGatewayFacebook: EventsGateway {

    func list(successHandler: (events: [Event]) -> (), errorHandler: (error: NSError) -> ()) {
        let graphRequest = FBSDKGraphRequest(
            graphPath: "/festivaldedancajoinville/events",
            parameters: ["fields": "start_time,name,cover,description,place,end_time"],
            HTTPMethod: "GET")

        graphRequest.startWithCompletionHandler { (connection, result, error) in
            if let error = error {
                errorHandler(error: error)
            }

            if let result = result {
                guard let data = result.valueForKey("data") as? [Dictionary<String, AnyObject>] else {
                    return
                }
                let events = data.map { (event) -> Event in
                    var eventStruct: Event = EventStruct()
                    eventStruct.name = event["name"] as? String
                    return eventStruct
                }
                successHandler(events: events)
            }
        }

    }

}
