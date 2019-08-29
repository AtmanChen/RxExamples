//
//  JobTableViewCell.swift
//  MyRxSwiftExample
//
//  Created by Buck on 2019/8/28.
//  Copyright © 2019 Buck. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var jobItem: JobItem? {
        didSet {
            if let j = jobItem {
                titleLabel.text = j.title
                expLabel.text = j.exp
                tagLabel.text = j.publisher
                subTitleLabel.text = j.more
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
