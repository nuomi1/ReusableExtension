//
//  Utils.swift
//  ReusableExtension
//
//  Created by nuomi1 on 19/3/2019.
//

import Reusable
import UIKit

func makeErrorMessage<T: UIView>(forType type: T.Type) -> String where T: Reusable {
    return "could not dequeue a view of kind: \(String(reflecting: type)) with identifier \(type.reuseIdentifier)"
        + " - "
        + "must register a nib or a class for the identifier or connect a prototype cell in a storyboard"
}
