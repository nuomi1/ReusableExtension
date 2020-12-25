//
//  FDTemplateLayoutCell+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 19/3/2019.
//  Copyright © 2019 nuomi1. All rights reserved.
//

import Reusable
import UITableView_FDTemplateLayoutCell

extension UITableView {

    public final func fd_templateCell<T: UITableViewCell>(cellType: T.Type) -> T where T: Reusable {
        let bareCell = fd_templateCell(forReuseIdentifier: cellType.reuseIdentifier)
        guard let cell = bareCell as? T else {
            fatalError(
                "could not dequeue a \(String(reflecting: UITableViewCell.self)) with identifier \(cellType.reuseIdentifier)"
                    + " - "
                    + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
            )
        }

        return cell
    }

    public final func fd_heightForCell<T: UITableViewCell>(
        cellType: T.Type,
        configuration: @escaping (T) -> Void
    ) -> CGFloat where T: Reusable {
        return fd_heightForCell(withIdentifier: cellType.reuseIdentifier) { bareCell in
            guard let cell = bareCell as? T else {
                // swiftlint:disable line_length
                fatalError(
                    "could not dequeue a \(String(reflecting: UITableViewCell.self)) with identifier \(cellType.reuseIdentifier)"
                        + " - "
                        + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
                )
                // swiftlint:enable line_length
            }
            configuration(cell)
        }
    }

    public final func fd_heightForCell<T: UITableViewCell>(
        cellType: T.Type,
        cacheBy indexPath: IndexPath,
        configuration: @escaping (T) -> Void
    ) -> CGFloat where T: Reusable {
        return fd_heightForCell(
            withIdentifier: cellType.reuseIdentifier,
            cacheBy: indexPath
        ) { bareCell in
            guard let cell = bareCell as? T else {
                // swiftlint:disable line_length
                fatalError(
                    "could not dequeue a \(String(reflecting: UITableViewCell.self)) with identifier \(cellType.reuseIdentifier)"
                        + " - "
                        + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
                )
                // swiftlint:enable line_length
            }
            configuration(cell)
        }
    }

    public final func fd_heightForCell<T: UITableViewCell>(
        cellType: T.Type,
        cacheByKey key: String,
        configuration: @escaping (T) -> Void
    ) -> CGFloat where T: Reusable {
        return fd_heightForCell(
            withIdentifier: cellType.reuseIdentifier,
            cacheByKey: key as NSString
        ) { bareCell in
            guard let cell = bareCell as? T else {
                // swiftlint:disable line_length
                fatalError(
                    "could not dequeue a \(String(reflecting: UITableViewCell.self)) with identifier \(cellType.reuseIdentifier)"
                        + " - "
                        + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
                )
                // swiftlint:enable line_length
            }
            configuration(cell)
        }
    }
}

extension UITableView {

    public final func fd_heightForHeaderFooterView<T: UITableViewHeaderFooterView>(
        viewType: T.Type,
        configuration: @escaping (T) -> Void
    ) -> CGFloat where T: Reusable {
        return fd_heightForHeaderFooterView(withIdentifier: viewType.reuseIdentifier) { bareView in
            guard let view = bareView as? T else {
                // swiftlint:disable line_length
                fatalError(
                    "could not dequeue a \(String(reflecting: UITableViewHeaderFooterView.self)) with identifier \(viewType.reuseIdentifier)"
                        + " - "
                        + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
                )
                // swiftlint:enable line_length
            }
            configuration(view)
        }
    }
}
