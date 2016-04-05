//
//  Array+Detect.swift
//  Mosaik
//
//  Created by Janusch Jacoby on 24/01/16.
//  Copyright © 2016 Janusch Jacoby. All rights reserved.
//

extension Array {
    /**
     Returns the element in the array that satisfies the given predicate, if any.
     
     - parameter predicate: predicate to be satisfied
     
     - returns: optional Element?
     */
    func detect(predicate: (Element) -> Bool) -> Element? {
        for x in self {
            let elem = x as Element;
            if predicate(elem) {
                return elem
            }
        }
        return nil
    }
}
