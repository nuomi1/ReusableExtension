//
//  VerticalCardSwiper+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 4/4/2019.
//

import Reusable
import VerticalCardSwiper

public extension VerticalCardSwiper {
    final func register<T: CardCell>(cellType: T.Type) where T: NibReusable {
        register(nib: cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    final func register<T: CardCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
}

public extension VerticalCardSwiperView {
    final func dequeueReusableCell<T: CardCell>(at index: Int,
                                                cellType: T.Type = T.self) -> T where T: Reusable {
        let bareCell = dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: index)
        guard let cell = bareCell as? T else {
            fatalError(makeErrorMessage(forType: cellType))
        }
        return cell
    }
}