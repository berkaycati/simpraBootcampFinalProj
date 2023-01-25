//
//  ViewController.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hearthButton: UIButton!
    
    var isActive: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    @IBAction func addNoteClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "AddNoteViewController") as? AddNoteViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
    
    
    @IBAction func heartButtonClicked(_ sender: Any) {
        
        if isActive == false {
            hearthButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            
            
            isActive = true
            
        } else {
            
            hearthButton.setImage(UIImage(systemName: "heart"), for: .normal)
            
        }
        
    }
}


