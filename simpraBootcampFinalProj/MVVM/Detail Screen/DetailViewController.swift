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
    @IBOutlet var nameLabel: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addNoteClicked(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "AddNoteViewController") as? AddNoteViewController {
            present(vc, animated: true)
        }
    }
    
    
}

extension DetailViewController: UITextFieldDelegate {
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
