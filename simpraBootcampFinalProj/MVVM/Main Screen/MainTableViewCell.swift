//
//  MainTableViewCell.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 21.01.2023.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupUI()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: MainCellModel) {
        mainImageView.kf.setImage(with: URL.init(string: model.imageURL))
        nameLabel.text = model.name
    }
    
}

private extension MainTableViewCell {

    private func setupUI() {
        nameLabel.text = "NameLabel"
        ratingLabel.text = "Rating: 10/10"
    }
    
}

struct MainCellModel {
    let imageURL: String
    let name: String
    let rating: String
}
