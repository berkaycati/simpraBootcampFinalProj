//
//  ViewController.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 20.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    typealias RowItem = MainCellModel
    
    private let viewModel = MainViewModel()
    //private var tableHelper: MainTableViewHelper!
    private var fetchingData : MainModel?
    
    private let cellIdentifier = "MainTableViewCell"
    private var items: [RowItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupUI()
        setupTableView()
        viewModel.didViewLoad()
        fetchingData?.fetchData()
        
    }
}




private extension MainViewController {
    
//    private func setupUI() {
//        self.tableView = tableView
//        self.viewModel = viewModel
//    }
    func setItems(_ items: [MainCellModel]) {
        self.items = items
        tableView?.reloadData()
    }
    
    private func setupBindings() {
        viewModel.onErrorDetected = { [weak self] message in
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(.init(title: "Ok", style: .default))
            self?.present(alertController, animated: true)
        }

        viewModel.refreshItem = { [weak self] items in
            self?.setItems(items)
            print(items)
        }
    }
    
  
    private func setupTableView() {
        tableView?.register(.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
   
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //viewModel?.cellPressed(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MainTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
}

