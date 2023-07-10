

import UIKit

class Settings: UITableViewCell{
    
    @IBOutlet private var infoLabel: UILabel!
    @IBOutlet private var switcher: UISwitch!
    
    func configure(with info: String) {
        infoLabel.text = info
    }
}
