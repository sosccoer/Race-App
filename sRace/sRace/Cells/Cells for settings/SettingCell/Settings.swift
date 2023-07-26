

import UIKit

class Settings: UITableViewCell{
    
    @IBOutlet  var infoLabel: UILabel!
    @IBOutlet  var switcher: UISwitch!
    
    weak var delegate: SettingDelegate?
    
    
    func configure(with info: String) {
        infoLabel.text = info
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func switchChnged(_ sender: Any) {
        delegate?.cell(self, changeValueTo: switcher.isOn)
    }
    
        
    }
    
protocol SettingDelegate: AnyObject {
    func cell (_ cell: Settings, changeValueTo isOn: Bool)
}
    
    

