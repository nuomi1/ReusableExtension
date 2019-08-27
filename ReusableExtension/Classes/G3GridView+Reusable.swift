//
//  G3GridView+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 20/4/2019.
//

import class G3GridView.GridView
import class G3GridView.GridViewCell
import Reusable

public extension GridView {
    final func register<T: GridViewCell>(cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func register<T: GridViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func dequeueReusableCell<T: GridViewCell>(for indexPath: IndexPath,
                                                    cellType: T.Type = T.self) -> T where T: Reusable {
        let bareCell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath)
        guard let cell = bareCell as? T else {
            fatalError(
                "could not dequeue a \(String(reflecting: GridViewCell.self)) with identifier \(cellType.reuseIdentifier)"
                    + " - "
                    + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
            )
        }
        return cell
    }
}
