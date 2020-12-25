//
//  RxCocoa+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 28/3/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import Reusable
import RxCocoa
import RxSwift

extension Reactive where Base: UICollectionView {

    public func items<Sequence: Swift.Sequence, Cell: UICollectionViewCell, Source: ObservableType>(cellType: Cell.Type)
        -> (_ source: Source)
        -> (_ configureCell: @escaping (Int, Sequence.Iterator.Element, Cell) -> Void)
        -> Disposable where Cell: Reusable, Source.Element == Sequence {
        return items(cellIdentifier: cellType.reuseIdentifier, cellType: cellType)
    }
}

extension Reactive where Base: UITableView {

    public func items<Sequence: Swift.Sequence, Cell: UITableViewCell, Source: ObservableType>(cellType: Cell.Type)
        -> (_ source: Source)
        -> (_ configureCell: @escaping (Int, Sequence.Iterator.Element, Cell) -> Void)
        -> Disposable where Cell: Reusable, Source.Element == Sequence {
        return items(cellIdentifier: cellType.reuseIdentifier, cellType: cellType)
    }
}
