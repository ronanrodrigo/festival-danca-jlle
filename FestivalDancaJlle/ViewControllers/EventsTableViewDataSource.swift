import Foundation
import FestivalDancaJlleCore

class EventsTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: Properties

    private let events: [Event]
    private let eventCellIdentifier = String(EventTableViewCell)

    // MARK: Initializers

    init(events: [Event]) {
        self.events = events
    }

    // MARK: TableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let event = events[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier(eventCellIdentifier) as? EventTableViewCell {
            cell.configure(event)
            return cell
        } else {
            let cell = EventTableViewCell()
            cell.configure(event)
            return cell
        }
    }

}
