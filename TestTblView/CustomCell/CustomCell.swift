//
//  CustomCell.swift
//  TestTblView
//
//  Created by Sai Praveen Kumar on 17/10/18.
//  Copyright © 2018 Mangi. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var colletionViewOne: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
