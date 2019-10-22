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
    @IBOutlet weak var spesializationView: UICollectionView!
    
    var spesialization = ["Semua", "Anak", "Kulit & Kelamin", "THT", "Kandungan", "Dokter Bedah"]
    
    var presenter: DashboardPresentation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)
        
        tableView.register(UINib(nibName: DashboardCellType.listDoctor.rawValue, bundle: Bundle.main), forCellReuseIdentifier: DashboardCellType.listDoctor.rawValue)
        
        spesializationView.showsHorizontalScrollIndicator = false
        spesializationView.register(UINib(nibName: "ListSpesializationCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "ListSpesializationCollectionViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        // add title left
        let leftTitle = UIBarButtonItem(title: "ALODOKTER", style: .plain, target: self, action: nil)
        leftTitle.tintColor = .white
        self.navigationItem.leftBarButtonItem = leftTitle
        
        // add right button
        let notifIcon = UIBarButtonItem(image: UIImage(named: "notif"), style: .plain, target: self, action: nil)
        notifIcon.tintColor = .white
        
        let buttonAvatar = UIButton()
        buttonAvatar.backgroundColor = .darkGray
        buttonAvatar.addTarget(self, action: #selector(self.didOpenProfile(_:)), for: .touchUpInside)
        buttonAvatar.frame = CGRect.init(x: 0, y: 0, width: 36, height: 36)
        buttonAvatar.layer.cornerRadius = buttonAvatar.frame.width / 2
        buttonAvatar.layer.masksToBounds = true
        let barButton = UIBarButtonItem(customView: buttonAvatar)
        
        self.navigationItem.rightBarButtonItems = [barButton, notifIcon]
        
    }

    @objc func didOpenProfile(_ sender: UIButton) {
        
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
    
}

extension DashboardUI: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spesialization.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListSpesializationCollectionViewCell", for: indexPath) as? ListSpesializationCollectionViewCell else { return UICollectionViewCell() }
        
        cell.spesializeName.text = spesialization[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let content = spesialization[indexPath.row]
        let contentLabel = content as NSString
        
        let size: CGSize = contentLabel.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)])
        
        return CGSize(width: size.width + 15.0, height: spesializationView.bounds.size.height)

    }
    
    
}


extension DashboardUI: DashboardView {
    
    func configureView(_ state: ViewStateKind) {
        switch state {
        case .success:
            break
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


