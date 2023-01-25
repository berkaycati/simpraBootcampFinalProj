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

    private var fetchingData : MainModel?

    
    typealias RowItem = MainCellModel
    private var items: [RowItem] = []
    private var notFilteredData: [MainCellModel] = []
    var filteredData: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notFilteredData = items
        tableView.delegate = self
        tableView.dataSource = self
        tableView.dataSource = self
        

        tableView.reloadData()
        
        setupUI()
        setupBindings()
        viewModel.didViewLoad()
        
        fetchingData?.fetchData()
    }
}




private extension MainViewController {
    
    private func setupUI() {

        tableView.register(.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        
    }
    
    func setItems(_ items: [RowItem]) {
        self.items = items
        notFilteredData = items
        tableView.reloadData()
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
    
    @objc func refreshData() {
        print("refreshed")
    }
}

extension MainViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
}
    
    
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
        
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
        
}

extension MainViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let nextViewController = segue.destination as? DetailViewController {
//                nextViewController.idLabel.text = 
            }
        }
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
