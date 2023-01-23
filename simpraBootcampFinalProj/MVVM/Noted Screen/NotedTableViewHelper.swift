//
//  NotedTableViewHelper.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import Foundation
import UIKit

class NotedTableViewHelper: NSObject {
    
    private(set) weak var notedTableView: UITableView?
    private var viewModel: NotedViewModel?
    
    typealias RowItem = MainCellModel
    private var items: [RowItem] = []
    
    init(notedTableView: UITableView, viewModel: NotedViewModel) {
        self.notedTableView = notedTableView
        self.viewModel = viewModel
        super.init()
        
        setupTableView()
    }
    
    private func setupTableView() {
        notedTableView?.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        notedTableView?.dataSource = self
        notedTableView?.delegate = self
        
    }
    
    func setItems(_ items: [RowItem]) {
        self.items = items
        notedTableView?.reloadData()
    }
}

extension NotedTableViewHelper: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
