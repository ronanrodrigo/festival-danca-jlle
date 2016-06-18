import UIKit

class EventsNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureListEvents()
    }

    // MARK: Setup

    private func configureListEvents() {
        let listEventsViewController = ListEventsViewController()
        setViewControllers([listEventsViewController], animated: true)
    }

}
