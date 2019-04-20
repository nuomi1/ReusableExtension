//
//  FDTemplateLayoutCell+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 19/3/2019.
//

import Reusable
import UITableView_FDTemplateLayoutCell

public extension UITableView {
    final func fd_heightForCell<T: UITableViewCell>(cellType: T.Type,
                                                    configuration: @escaping (T) -> Void) -> CGFloat where T: Reusable {
        return fd_heightForCell(withIdentifier: cellType.reuseIdentifier,
                                configuration: { bareCell in
                                    guard let cell = bareCell as? T else {
                                        fatalError(makeErrorMessage(forType: cellType))
                                    }
                                    configuration(cell)
        })
    }

    final func fd_heightForCell<T: UITableViewCell>(cellType: T.Type,
                                                    cacheBy indexPath: IndexPath,
                                                    configuration: @escaping (T) -> Void) -> CGFloat where T: Reusable {
        return fd_heightForCell(withIdentifier: cellType.reuseIdentifier,
                                cacheBy: indexPath,
                                configuration: { bareCell in
                                    guard let cell = bareCell as? T else {
                                        fatalError(makeErrorMessage(forType: cellType))
                                    }
                                    configuration(cell)
        })
    }

    final func fd_heightForCell<T: UITableViewCell>(cellType: T.Type,
                                                    cacheByKey key: String,
                                                    configuration: @escaping (T) -> Void) -> CGFloat where T: Reusable {
        return fd_heightForCell(withIdentifier: cellType.reuseIdentifier,
                                cacheByKey: key as NSString,
                                configuration: { bareCell in
                                    guard let cell = bareCell as? T else {
                                        fatalError(makeErrorMessage(forType: cellType))
                                    }
                                    configuration(cell)
        })
    }
}

public extension UITableView {
    final func fd_heightForHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type,
                                                                            configuration: @escaping (T) -> Void) -> CGFloat where T: Reusable {
        return fd_heightForHeaderFooterView(withIdentifier: viewType.reuseIdentifier,
                                            configuration: { bareView in
                                                guard let view = bareView as? T else {
                                                    fatalError(makeErrorMessage(forType: viewType))
                                                }
                                                configuration(view)
        })
    }
}
