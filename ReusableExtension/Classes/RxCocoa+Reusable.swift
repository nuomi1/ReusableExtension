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
    func items<S: Sequence, T: UICollectionViewCell, O: ObservableType>(cellType: T.Type)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, T) -> Void)
        -> Disposable where T: Reusable, O.E == S {
        return items(cellIdentifier: cellType.reuseIdentifier, cellType: cellType)
    }
}

public extension Reactive where Base: UITableView {
    func items<S: Sequence, T: UITableViewCell, O: ObservableType>(cellType: T.Type)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, T) -> Void)
        -> Disposable where T: Reusable, O.E == S {
        return items(cellIdentifier: cellType.reuseIdentifier, cellType: cellType)
    }
}
