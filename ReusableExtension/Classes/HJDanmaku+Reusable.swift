//
//  HJDanmaku+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 28/3/2019.
//

import HJDanmaku
import Reusable

public extension HJDanmakuView {

    final func register<T: HJDanmakuCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    final func dequeueReusableCell<T: HJDanmakuCell>(cellType: T.Type = T.self) -> T where T: Reusable {
        let bareCell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier)
        guard let cell = bareCell as? T else {
            fatalError(
                "could not dequeue a \(String(reflecting: HJDanmakuCell.self)) with identifier \(cellType.reuseIdentifier)"
                    + " - "
                    + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
            )
        }
        return cell
    }
}
