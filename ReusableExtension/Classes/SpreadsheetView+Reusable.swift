//
//  SpreadsheetView+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 19/3/2019.
//

import Reusable
import SpreadsheetView

public extension SpreadsheetView {
    final func register<T: Cell>(cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func register<T: Cell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func dequeueReusableCell<T: Cell>(for indexPath: IndexPath,
                                            cellType: T.Type = T.self) -> T where T: Reusable {
        let bareCell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath)
        guard let cell = bareCell as? T else {
            fatalError(
                "could not dequeue a \(String(reflecting: Cell.self)) with identifier \(cellType.reuseIdentifier)"
                    + " - "
                    + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
            )
        }
        return cell
    }
}
