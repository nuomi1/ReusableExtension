//
//  IGListKit+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 2020/8/20.
//  Copyright © 2020 nuomi1. All rights reserved.
//

import IGListKit
import Reusable

public extension ListCollectionContext {

    func dequeueReusableCell<T: UICollectionViewCell>(
        for sectionController: ListSectionController,
        at index: Int,
        cellType: T.Type = T.self
    ) -> T where T: Reusable {
        let bareCell = dequeueReusableCell(of: cellType, for: sectionController, at: index)
        guard let cell = bareCell as? T else {
            fatalError("could not dequeue a \(String(reflecting: UICollectionViewCell.self)) with identifier \(cellType.reuseIdentifier)"
                + " - "
                + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard")
        }

        return cell
    }
}

public extension ListCollectionContext {

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
        ofKind kind: String,
        for sectionController: ListSectionController,
        at index: Int,
        viewType: T.Type = T.self
    ) -> T where T: Reusable {
        let bareView = dequeueReusableSupplementaryView(
            ofKind: kind,
            for: sectionController,
            class: viewType,
            at: index
        )
        guard let view = bareView as? T else {
            fatalError(
                "could not dequeue a \(String(reflecting: UICollectionReusableView.self)) with identifier \(viewType.reuseIdentifier)"
                    + " - "
                    + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
            )
        }
        return view
    }
}
