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
    
    private let cellIdentifier = "MainTableViewCell"
    
    private var tableView: UITableView?
    private var viewModel: MainViewModel?
    
    private var items: [RowItem] = []
    
    init(tableView: UITableView, viewModel: MainViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        super.init()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView?.register(.init(nibName: "MainTableViewCell", bundle: nil),
        forCellReuseIdentifier: cellIdentifier)
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    func setItems(_ items: [RowItem]) {
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
        items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MainTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
}