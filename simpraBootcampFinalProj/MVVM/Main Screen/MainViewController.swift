//
//  ViewController.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 20.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let viewModel = MainViewModel()
    private var tableHelper: MainTableViewHelper!

//    private var fetchingData : MainModel?
//    private let cellIdentifier = "MainTableViewCell"
//    private var items: [RowItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindings()
        viewModel.didViewLoad()
        
        //fetchingData?.fetchData()
        //setupTableView()
        
    }
}




private extension MainViewController {
    
    private func setupUI() {
        tableHelper = .init(tableView: tableView, viewModel: viewModel, searchBar: searchBar)
    }
  
    
    private func setupBindings() {
        viewModel.onErrorDetected = { [weak self] message in
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(.init(title: "Ok", style: .default))
            self?.present(alertController, animated: true)
        }
        
        viewModel.refreshItem = { [weak self] items in
            self?.tableHelper.setItemss(items)
            print(items)
        }
    }
}

//extension MainViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        //notfilteredData = items.map { $0.backgroundImage }
//        
//        //        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        //        if let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
//        //            navigationController?.pushViewController(vc, animated: true)
//        //
//        //        }
//        
//    }
//}
