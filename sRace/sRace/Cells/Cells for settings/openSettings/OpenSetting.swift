

import UIKit

class OpenSetting: UITableViewCell {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var specialButton: UIButton!
    
    
    func configure(with text: String){
        nameLabel.text = text
    }
    
}
