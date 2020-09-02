//
//  UsersViewController.swift
//  TestTask
//
//  Created by Паша on 8/28/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var users: [User] = []
    
    let viewModel = UsersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        viewModel.successRequest = { [weak self] users in
            self?.users = users
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.fetchData()
        
        viewModel.errorRequest = { error in
            print(error.localizedDescription)
        }
    }
}

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: UserTableViewCell().identifier, for: indexPath) as! UserTableViewCell
        
        let user = users[indexPath.row]
        cell.user = user
        
        return cell
    }
    
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        let storyboard = UIStoryboard(name: "DetailUserViewController", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! DetailUserViewController
        viewController.user = user
        navigationController?.pushViewController(viewController, animated: true)
    }
}
//MARK: Set UI
extension UsersViewController {
    
    private func setupTableView() {
        
        let nib = UINib(nibName: UserTableViewCell().identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UserTableViewCell().identifier)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}
