import Foundation
import FestivalDancaJlleCore

class EventsTableViewDataSource: NSObject, UITableViewDataSource {

    // MARK: Properties

    private let events: [Event]
    private let cellIdentifier = "EventTableViewCell"

    // MARK: Initializers

    init(events: [Event]) {
        self.events = events
    }

    // MARK: Setup

    func configureListEventsUsecase() {

    }

    // MARK: TableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let event = events[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
            cell.textLabel!.text = event.name
            return cell
        } else {
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            cell.textLabel!.text = event.name
            return cell
        }
    }

}
