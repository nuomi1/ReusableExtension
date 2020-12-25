//
//  DataSourceKit+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 2020/1/29.
//  Copyright © 2020 nuomi1. All rights reserved.
//

import DataSourceKit
import Reusable

extension CellBinder {

    public init<T: UICollectionViewCell>(
        cellType: T.Type,
        registrationMethod: RegistrationMethod,
        configureCell: @escaping (T) -> Void
    ) where T: Reusable {
        self.init(
            cellType: cellType,
            registrationMethod: registrationMethod,
            reuseIdentifier: cellType.reuseIdentifier,
            configureCell: configureCell
        )
    }

    public init<T: UITableViewCell>(
        cellType: T.Type,
        registrationMethod: RegistrationMethod,
        configureCell: @escaping (T) -> Void
    ) where T: Reusable {
        self.init(
            cellType: cellType,
            registrationMethod: registrationMethod,
            reuseIdentifier: cellType.reuseIdentifier,
            configureCell: configureCell
        )
    }
}
