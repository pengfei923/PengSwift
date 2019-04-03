//
//  FollowNormalCell.swift
//  DouYuSwift
//
//  Created by hoomsun on 2019/3/26.
//  Copyright © 2019年 hoomsun. All rights reserved.
//

import UIKit

class FollowNormalCell: UITableViewCell {

    @IBOutlet weak var statusImageView: UIImageView!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        leftLabel.text = ""
        rightLabel.text = ""
        leftLabel.textColor = UIColor.darkGray
        rightLabel.textColor = UIColor.gray
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
