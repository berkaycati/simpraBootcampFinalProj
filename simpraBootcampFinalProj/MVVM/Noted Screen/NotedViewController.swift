//
//  NotedViewController.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import UIKit

class NotedViewController: UIViewController {
    
    @IBOutlet private weak var notedTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private let viewModel = NotedViewModel()
    private var tableHelper: NotedTableViewHelper!
    typealias RowItem = MainCellModel
    private var items: [RowItem] = []
    private var notFilteredData: [MainCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        setupTableView()
//        setItems(items)
//        viewModel.didViewLoad()
        
        setupUI()
        setupBindings()
        viewModel.didViewLoad()
    }

    
}

//extension NotedViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
//        cell.nameLabel.text = "Berkay"
//        return cell
//    }
//}

extension NotedViewController {
    func setItems(_ items: [RowItem]) {
        self.items = items
        notedTableView?.reloadData()
    }
//    private func setupTableView() {
//        notedTableView?.dataSource = self
//        notedTableView?.delegate = self
//        notedTableView?.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
//    }
    
//    func setItems(_ items: [MainCellModel]) {
//        self.items = items
//        notedTableView?.reloadData()
//    }
    
    private func setupUI() {
        tableHelper = .init(notedTableView: notedTableView, viewModel: viewModel)
        searchBar.delegate = self
    }
    
    func setupBindings(){
        viewModel.onErrorDetected = { [weak self] message in
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert )
            alertController.addAction(.init(title: "OK", style: .default))
            self?.present(alertController, animated: true)
        }
        viewModel.refreshItem = { [weak self] items in
            self?.tableHelper.setItems(items)
        }
    }
}

extension NotedViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            setItems(notFilteredData)
        } else {
            items = notFilteredData.filter { $0.name.contains(searchText) }
            notedTableView.reloadData()
        }

    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        setItems(notFilteredData)
    }
      
}
