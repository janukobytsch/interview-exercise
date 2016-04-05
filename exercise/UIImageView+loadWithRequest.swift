//
//  UIImageView+loadWithRequest.swift
//  Mosaik
//
//  Created by Jakob Frick on 12/03/16.
//  Copyright © 2016 Janusch Jacoby. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    
    func loadImageWith(request: ImageRequest, afterInitClosure: ((task: Nuke.ImageTask) -> Void)?, fractionClosure: [Double : () -> Void]?, completionClosure: (() -> Void)?) {
        let task = self.nk_setImageWithRequest(request)
        
        task.progress = { [weak self, weak task] _, _ in
            guard let task = task where task == self!.nk_imageTask else {
                return
            }
            
            if let initClosure = afterInitClosure {
                initClosure(task: task)
            }
            
            if let fractionClosure = fractionClosure {
                if let closure = fractionClosure[task.fractionCompleted] {
                    closure()
                }
            }
        }
        
        if let closure = completionClosure where task.state == .Completed {
            closure()
        }
    }
}