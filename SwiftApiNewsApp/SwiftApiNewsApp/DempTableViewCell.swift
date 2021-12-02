//
//  DempTableViewCell.swift
//  SwiftApiNewsApp
//
//  Created by İbrahim Demirci on 2.12.2021.
//

import UIKit

class DempTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var story: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
