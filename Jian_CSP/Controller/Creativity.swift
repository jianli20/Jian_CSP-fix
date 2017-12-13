//
//  Creativity.swift
//  Jian_CSP
//
//  Created by Li, Jian Hong on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
//Mark: - Class type should inherit from UICollectionViewControllr
public class Creativity: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    private let reuseIdentifier = "artIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow : CGFloat = 3
    
    private lazy var artSelection : [UIImage?] =
    {
        return [
            UIImage(named: "javaSample"),
            UIImage(named: "pingo"),
            UIImage(named: "fire"),
            UIImage(named: "water"),
            UIImage(named: "grass")
            ]
    }()

    var largePhotoIndexPath: IndexPath?
    {
        didSet
        {
            var indexPaths = [IndexPath] ()
            if let largePhotoIndexPath = largePhotoIndexPath
            {
                indexPaths.append(largePhotoIndexPath)
            }
            if let oldValue = oldValue
            {
                indexPaths.append(oldValue)
            }
            
           collectionView?.performBatchUpdates(
                {
                    self.collectionView?.reloadItems(at: indexPaths)
                })
            {
                completed in
                
                if let largePhotoIndexPath = self.largePhotoIndexPath
                {
                    self.collectionView?.scrollToItem(at: largePhotoIndexPath,
                                                                          at: .centeredVertically,
                                                                          animated: true)
                }
            }
        }
    }
    
    //Mark: lifecycle methods
    override public func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //Mark:- UICollectionView methods
    
    override public func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    
    {
        return artSelection.count
    }
    
    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .cyan
        artCell.imageView.image = artSelection[indexPath.row]
        artCell.imageName.text = "My Art"
        
        return artCell
    }
    
    //MARK:- Delegate methods
    
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath == largePhotoIndexPath
        {
            let art = artSelection[indexPath.row]
            let size = collectionView.bounds.size
            let widthScale = (size.width / art!.size.width) * CGFloat(0.80)
            let largeSize = CGSize(width: art!.size.width * widthScale, height: art!.size.height * widthScale)
            
            return largeSize
        }
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    public func collectionView(_collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets
    
    {
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                                             layout collectionViewLayout: UICollectionViewLayout,
                                             minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }
    
    override public func collectionView(_ collecViwe: UICollectionView,
                                        shouldSelectItemAt indexPath: IndexPath) -> Bool
    {
        if largePhotoIndexPath == indexPath
        {
            largePhotoIndexPath = nil
        }
        else
        {
            largePhotoIndexPath = indexPath
        }
        return false
    }
}
