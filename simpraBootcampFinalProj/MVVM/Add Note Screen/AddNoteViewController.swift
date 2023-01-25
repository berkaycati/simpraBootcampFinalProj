//
//  AddNoteViewController.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 24.01.2023.
//

import UIKit

class AddNoteViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        commentTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    
        
    }

    
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
//        let enteredNote = textField.text
        
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController {
            dismiss(animated: true)
        }
        
    }
    
}
extension AddNoteViewController: UITextFieldDelegate {
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? true {
            let alert = UIAlertController(title: "Error", message: "Please enter a note", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        saveButton.isEnabled = !(textField.text?.isEmpty ?? true)
    }
}
