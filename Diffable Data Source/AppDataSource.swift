//
//  AppDataSource.swift
//  Diffable Data Source
//
//  Created by Stewart Lynch on 2019-07-02.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

import UIKit

 typealias UserDataSource = UITableViewDiffableDataSource<Section,User>
 typealias UserSnapshot = NSDiffableDataSourceSnapshot<Section,User>

class AppDataSource: NSObject {
    var users:[User] = [User(name: "John"),User(name: "Paul"),User(name: "George"),User(name: "Ringo")]

    var dataSource: UserDataSource!
    
    func configureDataSource(tableView:UITableView) {
        // This handles the datasource functions
        
        dataSource = UserDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, user) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = user.name
            return cell
        })
        createSnapshot(from: users)
    }
    
    private func createSnapshot(from users: [User]) {
        let snapshot = UserSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(users)
        dataSource.apply(snapshot,animatingDifferences: true)
    }
    
    func moveUser(from orig:User, after:User) {
        let snapshot = dataSource.snapshot()
        snapshot.moveItem(orig, afterItem: after)
        dataSource.apply(snapshot,animatingDifferences: true)
    }
    
    func remove(_ user: User, animate: Bool = true) {
        let snapshot = dataSource.snapshot()
        snapshot.deleteItems([user])
        dataSource.apply(snapshot, animatingDifferences: animate)
    }
    
    func addUser(user:User) {
        let snapshot = dataSource.snapshot()
        snapshot.appendItems([user])
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}
