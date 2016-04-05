//
//  TaggedImageView.swift
//  Mosaik
//
//  Created by Janusch Jacoby on 22/01/16.
//  Copyright © 2016 Janusch Jacoby. All rights reserved.
//

import UIKit
import Nuke

class ShowCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.reset()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    func reset() {
        self.progressView.progress = 0
        self.progressView.alpha = 1
        self.imageView.nk_prepareForReuse()
    }
    
    // MARK: Image loading
    
    func setImageWithURL(URL: NSURL) {
        imageView.loadImageWith(ImageRequest(URL: URL), afterInitClosure: { task in
            self.progressView.setProgress(Float(task.fractionCompleted), animated: true)
            },
            fractionClosure: [1: {
                UIView.animateWithDuration(0.2) {
                    self.progressView.alpha = 0
                }
                }]) {
                    self.progressView.alpha = 0
        }
    }
}