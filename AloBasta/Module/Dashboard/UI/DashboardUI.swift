//  
//  DashboardUI.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class DashboardUI: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: DashboardPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Dashboard"
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 66
        tableView.sectionIndexColor = UIColor.lightGray
        
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: DashboardCellType.list.rawValue, bundle: nil), forCellReuseIdentifier: DashboardCellType.list.rawValue)
        
        presenter.loadImages()
    }
    
}


extension DashboardUI: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter?.item(at: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: item.type, for: indexPath)
        (cell as? CellConfigurable)?.configure(with: item)
        cell.accessibilityLabel = item.type
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = presenter.selectedImage(indexPath)
        presenter.presentDetail(data)
    }
    
}


extension DashboardUI: DashboardView {
    
    func configureView(_ state: ViewStateKind) {
        switch state {
        case .success:
            self.tableView.reloadData()
        case .error(let error):
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            self.showAlert(viewController: self, prefferedStyle: .alert, title: "Oops", message: error, alertActions: [okAction])
        case .initial:
            break
        case .empty:
            break
        }
    }
    
}


