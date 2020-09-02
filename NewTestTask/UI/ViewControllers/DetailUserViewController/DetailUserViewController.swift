//
//  DetailUserViewControoler.swift
//  TestTask
//
//  Created by Паша on 9/2/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import UIKit

class DetailUserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var user: User!
    
    var headers: [String] = []
    var cells: [[Any]] = []
    
    var viewModel = DetailUserViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        
        viewModel.userDetails = { [weak self] (cells, headers) in
            self?.cells = cells
            self?.headers = headers
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.getDetails(user)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let headerView = tableView.tableHeaderView else { return }
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.height != size.height {
            var frame = headerView.frame
            frame.size.height = size.height
            headerView.frame = frame
            tableView.tableHeaderView = headerView
            tableView.layoutIfNeeded()
        }
    }
    
}
//MARK: TableViewDataSource

extension DetailUserViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let object = cells[indexPath.section][indexPath.row]
        
        if let progress = object as? ProgressIndicatorCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProgressIndicatorTableViewCell().identifier, for: indexPath) as! ProgressIndicatorTableViewCell
            cell.progressIndicator = progress
            return cell
        } else if let detail = object as? UserCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailsTableViewCell().identifier, for: indexPath) as! UserDetailsTableViewCell
            cell.detail = detail
            return cell
        }
        
        return UITableViewCell()
    }
}
//MARK: TableViewDelegate
extension DetailUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderSectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 48))
        headerView.setTitle(headers[section])
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
}
//MARK: UI
extension DetailUserViewController {
    func setTableView() {
        
        let progressNib = UINib(nibName: ProgressIndicatorTableViewCell().identifier, bundle: nil)
        tableView.register(progressNib, forCellReuseIdentifier: ProgressIndicatorTableViewCell().identifier)
        let detailNib = UINib(nibName: UserDetailsTableViewCell().identifier, bundle: nil)
        tableView.register(detailNib, forCellReuseIdentifier: UserDetailsTableViewCell().identifier)
        
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let headerView = HeaderView()
        headerView.user = user
        tableView.tableHeaderView = headerView
    }
}
