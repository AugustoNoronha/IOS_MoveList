//
//  UICell.swift
//  iosProjectAugusto
//
//  Created by COTEMIG on 03/12/21.
//

import UIKit

class UICell: UITableViewCell {

    
    @IBOutlet weak var timeLastText: UILabel!
    
    @IBOutlet weak var nameMoveText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
