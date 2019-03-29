//
//  FSPagerView+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 19/3/2019.
//

import FSPagerView
import Reusable

public extension FSPagerView {
    final func register<T: FSPagerViewCell>(cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func register<T: FSPagerViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func dequeueReusableCell<T: FSPagerViewCell>(at index: Int,
                                                       cellType: T.Type = T.self) -> T where T: Reusable {
        let bareCell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, at: index)
        guard let cell = bareCell as? T else {
            fatalError(makeErrorMessage(forType: cellType))
        }
        return cell
    }
}
