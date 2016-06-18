import Foundation

class ListEventsPresenterSpy: ListEventsPresenter {
    var successSpied = false
    var errorSpied = false

    func success(events: [Event]) {
        successSpied = true
    }

    func error(error: NSError) {
        errorSpied = true
    }
}
