//
//  ViewController.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 20.01.2023.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    


    @IBOutlet weak var tableView: UITableView!

    @IBOutlet private weak var tableView: UITableView!


    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    //typealias RowItem = MainCellModel
    private let viewModel = MainViewModel()
    private var tableHelper: MainTableViewHelper!


    //private var fetchingData : MainModel?
    //private let cellIdentifier = "MainTableViewCell"
    //private var items: [RowItem] = []

    

    private var fetchingData : MainModel?
    typealias RowItem = MainCellModel
    private var items: [RowItem] = []
    private var notFilteredData: [MainCellModel] = []
    let detailVC = DetailedViewController()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()


        viewModel.didViewLoad()

        setupBindings()
        viewModel.didViewLoad()
        //fetchingData?.fetchData()
 
    }
        setupBindings()
        viewModel.didViewLoad()
        fetchingData?.fetchData()
}




extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = items[indexPath.row]
        let detailVC = DetailedViewController()
        if self.navigationController != nil {
//            let detailVC = AddNoteViewController()
//            detailVC.updateData = { [weak self] data in
//                let result = Result(id: selectedData.id, name: selectedData.name, released: selectedData.released, backgroundImage: selectedData.backgroundImage, rating: selectedData.rating)
//                detailVC.updateData(data: result)
//            }
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
        
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
}


extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            setItems(notFilteredData)
        } else {
            items = notFilteredData.filter { $0.name.contains(searchText) }
            tableView.reloadData()
        }

    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        setItems(notFilteredData)
    }
      
}

extension MainViewController {
    
    private func setupUI() {
        tableView.register(.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        notFilteredData = items
        tableView.delegate = self
        tableView.dataSource = self
        tableView.dataSource = self
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        // execute your code here
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
        
    }
    
    func setItems(_ items: [RowItem]) {
        self.items = items
        notFilteredData = items
        tableView.reloadData()
    }
  
    
    func setupBindings() {
        viewModel.onErrorDetected = { [weak self] message in
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(.init(title: "Ok", style: .default))
            self?.present(alertController, animated: true)
        }
        
        viewModel.refreshItem = { [weak self] items in
            self?.setItems(items)
            
        }
    }
    
    @objc func refreshData() {
        print("refreshed")
    }
}


private extension MainViewController {
    
    private func setupUI() {
        tableHelper = .init(tableView: tableView, viewModel: viewModel)
    }
//    func setItems(_ items: [MainCellModel]) {
//        self.items = items
//        tableView?.reloadData()
//    }
    
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
    
  
//    private func setupTableView() {
//        tableView?.register(.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
//        tableView?.delegate = self
//        tableView?.dataSource = self
//    }
    
   
}

//extension MainViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //viewModel?.cellPressed(indexPath.row)
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MainTableViewCell
//        cell.configure(with: items[indexPath.row])
//        return cell
//    }
//}



