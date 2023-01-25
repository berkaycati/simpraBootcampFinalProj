//
//  MainTableViewCell.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 21.01.2023.
//

import UIKit
import Kingfisher

class MainTableViewCell: UITableViewCell {
   
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    
    typealias RowItem = MainCellModel
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //
        setupUI()
        
        
    }

    
    
//    func configure(with model: RowItem) {
//        mainImageView.kf.setImage(with: URL.init(string: model.backgroundImage))
//        nameLabel.text = model.name ?? "berkuy"
//        ratingLabel.text = "Rating: \(model.rating)" ?? "Rating is ??"
//        idLabel.text = "Game id is \(model.id)" ?? "Unknown Id"
//        releasedLabel.text = "Released Date: \(model.released)"
//
//    }
    
    func configure(with model: RowItem) {
        mainImageView.kf.setImage(with: URL.init(string: model.backgroundImage))
        nameLabel.text = model.name
        ratingLabel.text = "Rating: \(model.rating)"
        idLabel.text = "Game id is \(model.id)"
        releasedLabel.text = "Released Date: \(model.released)"
    }

}

private extension MainTableViewCell {

    private func setupUI() {
        nameLabel.text = "NameLabel"
        ratingLabel.text = "Rating: 10/10"
        idLabel.text = "idLabeL"
    }
    
}

struct MainCellModel {
    let id: Int
    let name, released: String
    let backgroundImage: String
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
    }
}
