//
//  NotedTableViewHelper.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import Foundation
import UIKit

//class NotedTableViewHelper: NSObject {
//    
//    private(set) weak var notedTableView: UITableView?
//    private var viewModel: NotedViewModel?
//    
//    typealias RowItem = MainCellModel
//    private var items: [RowItem] = []
//    
//    init(notedTableView: UITableView, viewModel: NotedViewModel) {
//        self.notedTableView = notedTableView
//        self.viewModel = viewModel
//        super.init()
//        
//        setupTableView()
//    }
//    
//    private func setupTableView() {
//        notedTableView?.dataSource = self
//        notedTableView?.delegate = self
//        notedTableView?.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
//    }
//    
//    func setItemss(_ items: [RowItem]) {
//        self.items = items
//        notedTableView?.reloadData()
//    }
//}
//
//extension NotedTableViewHelper: UITableViewDelegate, UITableViewDataSource {
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
