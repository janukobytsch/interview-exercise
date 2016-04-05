//
//  ViewController.swift
//  exercise
//
//  Created by Janusch Jacoby on 05/04/16.
//  Copyright © 2016 mosaikapp. All rights reserved.
//

import UIKit

class FeedController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellReuseID = "ShowCollectionViewCell"
    
    @IBOutlet weak var showCollection: UICollectionView!
    
    
    var items = [Show]() {
        didSet {
            showCollection.reloadData()
        }
    }
    
    let apiClient = APIClient()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register nibs
        showCollection.registerNib(UINib(nibName: cellReuseID, bundle: nil),
            forCellWithReuseIdentifier: cellReuseID)
        
        // setup delegates
        showCollection.dataSource = self
        showCollection.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        if items.isEmpty {
            // just returns a stub, so no async networking here
            let shows = apiClient.loadHomeFeed()
            items += shows
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        showCollection!.delegate = nil
        showCollection!.dataSource = nil
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        cell.prepareForReuse()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellReuseID, forIndexPath: indexPath)
            as! ShowCollectionViewCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let cell = cell as! ShowCollectionViewCell
        let image = self.items[indexPath.row].image!
        let imageUrl = NSURL(string: image.largestUrl!)!
        cell.setImageWithURL(imageUrl)
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // square cells
        let width = collectionView.bounds.size.width
        return CGSize(width: width, height: width)
    }

}

