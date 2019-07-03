//
//  UsersViewController.swift
//  Diffable Data Source
//
//  Created by Kyle Lee on 7/1/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit


class UsersViewController: UITableViewController {

    private let alertService = AlertService()
    var appDataSource = AppDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = appDataSource.dataSource
        appDataSource.configureDataSource(tableView: tableView)
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddButton))
        self.navigationItem.rightBarButtonItems = [self.editButtonItem,addButton]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = appDataSource.dataSource.itemIdentifier(for: indexPath) else { return }
        print(user.name)
    }
    
    @objc func didTapAddButton() {
        let alert = alertService.createUserAlert { [weak self] name in
            let user = User.newUser(name: name)
            self?.appDataSource.addUser(user: user)
        }
        present(alert, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (action, view, actionPerformed: (Bool) -> ()) in
            guard let user = self.appDataSource.dataSource.itemIdentifier(for: indexPath) else { return }
            self.appDataSource.remove(user, animate: true)
            actionPerformed(true)
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        config.performsFirstActionWithFullSwipe = false
        return config
    }
    
    // This is what I cannot get working!!!!
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let itemToMove = appDataSource.dataSource.itemIdentifier(for: sourceIndexPath) else { return }
        guard let destinationItem = appDataSource.dataSource.itemIdentifier(for: destinationIndexPath) else { return }
        appDataSource.moveUser(from: itemToMove, after: destinationItem)
    }

}


