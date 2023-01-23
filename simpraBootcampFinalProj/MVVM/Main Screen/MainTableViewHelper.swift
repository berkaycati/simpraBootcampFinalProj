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
    private var vc: MainViewController?
//    private let cellIdentifier = "MainTableViewCell"

    private var tableView: UITableView?
    private weak var viewModel: MainViewModel?
    private var searchBar: UISearchBar?
    
    private var items: [RowItem] = []
    var notfilteredData: [String] = []
    var filteredData: [String] = []
    
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
        //viewModel?.cellPressed(indexPath.row)
//        vc?.performSegue(withIdentifier: "toDetailedVC", sender: items[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.navigationController?.pushViewController(vc!, animated: true)
        
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
        
//        filteredData = items.compactMap { (names) -> String? in
//            if names.name.lowercased().range(of: searchText.lowercased()) != nil {
//                return names.name
//            } else {
//                return nil
//            }
//        }
        
        notfilteredData = items.map { $0.name }
        
        print(notfilteredData)
        
        filteredData = searchText.isEmpty ? notfilteredData : notfilteredData.filter({(str: String) -> Bool in
            return str.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        
        tableView?.reloadData()
        
//        if searchText.isEmpty {
//            filteredData = []
//        } else {
//            filteredData = filteredData.filter
//        }
    }
}
