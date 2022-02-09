//
//  UITableView+CoreLayout.swift
//  CoreLayout
//
//  Created by Aitor Salvador on 22/06/2019.
//  Copyright © 2019 Aitor Salvador All rights reserved.
//

public extension UITableView {
    func register(_ cells: UITableViewCell.Type ...) {
        cells.forEach { cell in
            register(cell.self, forCellReuseIdentifier: cell.identifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(ofClass: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}

// MARK: - Hide Empty Rows

public extension UITableView {
    func hideTopSeparatorForEmptyRows() {
        tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0.0, height: Double(Float.leastNormalMagnitude)))
    }

    func hideBottomSeparatorForEmptyRows() {
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0.0, height: Double(Float.leastNormalMagnitude)))
    }
}

