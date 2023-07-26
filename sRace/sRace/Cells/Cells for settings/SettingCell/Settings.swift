
import UIKit

class Settings: UITableViewCell{
    
    @IBOutlet  var infoLabel: UILabel!
    @IBOutlet  var switcher: UISwitch!
    
    weak var delegate: SettingDelegate?
    
    @IBAction func switchChnged(_ sender: Any) {
        delegate?.cell(self, changeValueTo: switcher.isOn)
    }
    
}

protocol SettingDelegate: AnyObject {
    func cell (_ cell: Settings, changeValueTo isOn: Bool)
}
