//
//  RxCocoa+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 28/3/2019.
//

import Reusable
import RxCocoa
import RxSwift

public extension Reactive where Base: UICollectionView {
    func items<Sequence: Swift.Sequence, T: UICollectionViewCell, Source: ObservableType>(cellType: T.Type)
        -> (_ source: Source)
        -> (_ configureCell: @escaping (Int, Sequence.Iterator.Element, T) -> Void)
        -> Disposable where T: Reusable, Source.Element == Sequence {
        return items(cellIdentifier: cellType.reuseIdentifier, cellType: cellType)
    }
}

public extension Reactive where Base: UITableView {
    func items<Sequence: Swift.Sequence, T: UITableViewCell, Source: ObservableType>(cellType: T.Type)
        -> (_ source: Source)
        -> (_ configureCell: @escaping (Int, Sequence.Iterator.Element, T) -> Void)
        -> Disposable where T: Reusable, Source.Element == Sequence {
        return items(cellIdentifier: cellType.reuseIdentifier, cellType: cellType)
    }
}
