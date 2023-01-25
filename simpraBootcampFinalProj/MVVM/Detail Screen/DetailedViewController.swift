//
//  DetailedViewController.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 25.01.2023.
//

import UIKit
import Kingfisher

class DetailedViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var updateData: ((Result) -> Void)?
        
    
//    override func viewWillAppear(_ animated: Bool) {
//        nameLabel.text = "NameLabel"
//        ratingLabel.text = "ratin"
//        idLabel.text = "id"
//        releasedLabel.text = "released"
//        imageView.image = UIImage(systemName: "heart")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    func updateData(data: Result) {
        // Update data here

        
        self.ratingLabel.text = data.rating?.description
        self.idLabel.text = data.id?.description
        self.releasedLabel.text = data.released
        self.nameLabel.text = data.name
    }

}
