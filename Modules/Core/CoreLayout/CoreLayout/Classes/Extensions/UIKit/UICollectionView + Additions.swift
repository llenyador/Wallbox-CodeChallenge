//
//  UICollectionView + Additions.swift
//  Reorder Table Test
//
//  Created by Aitor Salvador on 23/12/2019.
//  Copyright © 2019 aitorsalvador. All rights reserved.
//

import UIKit

public extension UICollectionView {
    func registerCellsWithNib(_ cells: UICollectionViewCell.Type ...) {
        cells.forEach { cell in
            let nib = UINib(nibName: cell.identifier, bundle: .main)
            register(nib, forCellWithReuseIdentifier: cell.identifier)
        }
    }
    
    func register(_ cells: UICollectionViewCell.Type ...) {
        cells.forEach { cell in
            register(cell.self, forCellWithReuseIdentifier: cell.identifier)
        }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(ofClass: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
