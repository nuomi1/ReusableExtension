//
//  FSPagerView+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 19/3/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import FSPagerView
import Reusable

extension FSPagerView {

    public final func register<T: FSPagerViewCell>(cellType: T.Type) where T: NibReusable {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    public final func register<T: FSPagerViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    public final func dequeueReusableCell<T: FSPagerViewCell>(
        at index: Int,
        cellType: T.Type = T.self
    ) -> T where T: Reusable {
        let bareCell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, at: index)
        guard let cell = bareCell as? T else {
            fatalError(
                "could not dequeue a \(String(reflecting: FSPagerViewCell.self)) with identifier \(cellType.reuseIdentifier)"
                    + " - "
                    + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
            )
        }
        return cell
    }
}
