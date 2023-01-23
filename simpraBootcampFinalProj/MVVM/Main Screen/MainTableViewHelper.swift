//
//  MainTableViewHelper.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 21.01.2023.
//

import Foundation
import UIKit

class MainTableViewHelper: NSObject {
    
    typealias RowItem = MainCellModel
    
//    private let cellIdentifier = "MainTableViewCell"
    
    private var tableView: UITableView?
    private weak var viewModel: MainViewModel?
    private var searchBar: UISearchBar?
    
    private var items: [RowItem] = []
    var filteredData : [String]?
    
    init(tableView: UITableView, viewModel: MainViewModel, searchBar: UISearchBar) {
        self.tableView = tableView
        self.viewModel = viewModel
        self.searchBar = searchBar
        super.init()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView?.register(.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        tableView?.delegate = self
        tableView?.dataSource = self
        searchBar?.delegate = self
    }
    
    func setItemss(_ items: [RowItem]) {
        self.items = items
        tableView?.reloadData()
    }
 }

extension MainTableViewHelper: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.cellPressed(indexPath.row)
    }

}

extension MainTableViewHelper: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }

}

extension MainTableViewHelper: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = items.compactMap { (names) -> String? in
            if names.name.lowercased().range(of: searchText.lowercased()) != nil {
                return names.name
            } else {
                return nil
            }
        }
        
        print(searchText)
        tableView?.reloadData()
        
//        if searchText.isEmpty {
//            filteredData = []
//        } else {
//            filteredData = filteredData.filter
//        }
    }
}
