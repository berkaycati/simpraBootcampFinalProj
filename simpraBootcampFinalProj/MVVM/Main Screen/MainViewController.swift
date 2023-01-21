//
//  ViewController.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 20.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = MainViewModel()
    private var tableHelper: MainTableViewHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.didViewLoad()
        
    }


}

private extension MainViewController {
    private func setupUI() {
        
    }
}
