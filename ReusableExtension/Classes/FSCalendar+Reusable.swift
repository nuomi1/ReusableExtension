//
//  FSCalendar+Reusable.swift
//  ReusableExtension
//
//  Created by nuomi1 on 28/8/2019.
//

import FSCalendar
import Reusable

public extension FSCalendar {

    final func register<T: FSCalendarCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    final func dequeueReusableCell<T: FSCalendarCell>(
        for date: Date,
        at position: FSCalendarMonthPosition,
        cellType: T.Type = T.self
    ) -> T where T: Reusable {
        let bareCell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: date, at: position)
        guard let cell = bareCell as? T else {
            fatalError(
                "could not dequeue a \(String(reflecting: FSCalendarCell.self)) with identifier \(cellType.reuseIdentifier)"
                    + " - "
                    + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
            )
        }
        return cell
    }
}
