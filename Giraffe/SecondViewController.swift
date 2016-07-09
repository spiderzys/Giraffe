//
//  SecondViewController.swift
//  Giraffe
//
//  Created by YANGSHENG ZOU on 2016-07-07.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var brandCollectionView: UICollectionView!
    
    @IBOutlet weak var displaySegmentedControl: UISegmentedControl!
    
    let brandCellReuseIdentifier = "brand"
    var brandImageStringArray = ["b0","b1","b2","b3","b4","b5","b6","b7","b8","b9","b10","b11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brandCollectionView.registerNib(UINib.init(nibName: "BrandCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: brandCellReuseIdentifier)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentChanged(sender: UISegmentedControl) {
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize{
        
        if collectionView.bounds.width > 400 {
            return CGSizeMake(collectionView.bounds.width/3.0-8, collectionView.bounds.width/3.0-8)
        }
        
        return CGSizeMake(collectionView.bounds.width/3.0-5.4, collectionView.bounds.width/3.0-5.4)
    }
    
        
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return brandImageStringArray.count
    }
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let brandCell = collectionView.dequeueReusableCellWithReuseIdentifier(brandCellReuseIdentifier, forIndexPath: indexPath) as! BrandCollectionViewCell
        brandCell.brandImageView.image = UIImage.init(named: brandImageStringArray[indexPath.row])
        brandCell.contentView.backgroundColor = UIColor.grayColor()
        return brandCell
    }
}

