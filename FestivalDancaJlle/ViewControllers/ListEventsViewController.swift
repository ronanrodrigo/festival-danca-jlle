import UIKit
import FBSDKLoginKit
import FestivalDancaJlleCore

class ListEventsViewController: UIViewController, LoginWithFacebookPresenter, ListEventsPresenter {

    // MARK: Properties

    private var eventsTableViewDataSource: EventsTableViewDataSource?
    private let eventCellIdentifier = String(EventTableViewCell)

    // MARK: Outlets

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var eventsTableView: UITableView!

    // MARK: Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSession()
        configureTableView()
    }

    private func configureSession() {
        if FBSDKAccessToken.currentAccessToken() != nil {
            loginButton.hidden = true
            ListEventsUsecaseFactory.make(self).list()
        }
    }

    private func configureTableView() {
        eventsTableView.registerNib(
            UINib(nibName: eventCellIdentifier, bundle: nil), forCellReuseIdentifier: eventCellIdentifier)
    }

    // MARK: Actions

    @IBAction func didTappedAtLogin(sender: AnyObject) {
        LoginWithFacebookUsecaseFactory.make(self, presenter: self).login()
    }

    // MARK: LoginWithFacebookPresenter & ListEventsPresenter

    func error(error: NSError) {
        print(error.description)
    }

    // MARK: LoginWithFacebookPresenter

    func cancel() {
        loginButton.setTitle("try_login_again".localized, forState: .Normal)
    }

    func success(token: String, userID: String) {
        configureSession()
    }

    // MARK: ListEventsPresenter

    func success(events: [Event]) {
        eventsTableViewDataSource = EventsTableViewDataSource(events: events)
        if let eventsTableViewDataSource = eventsTableViewDataSource {
            eventsTableView.dataSource = eventsTableViewDataSource
            eventsTableView.reloadData()
        }
    }

}
