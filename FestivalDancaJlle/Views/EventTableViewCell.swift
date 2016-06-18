import UIKit
import FestivalDancaJlleCore

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var attending: UILabel!
    @IBOutlet weak var details: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(event: Event) {
        name.text = event.name
    }

}
