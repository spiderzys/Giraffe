//
//  FirstViewController.swift
//  Giraffe
//
//  Created by YANGSHENG ZOU on 2016-07-09.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var productScrollView: UIScrollView!
    
    @IBOutlet weak var testView: UIView!
    let bannerCellReuseIdentifier = "banner"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(productScrollView.bounds)
        print(productScrollView.contentSize)
        print(testView.bounds.size)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize{
        
        return collectionView.bounds.size
    }
    
    
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return 0
    }
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let bannerCell = collectionView.dequeueReusableCellWithReuseIdentifier(bannerCellReuseIdentifier, forIndexPath: indexPath) as! homeBannerCollectionViewCell
        //brandCell.brandImageView.image = UIImage.init(named: brandImageStringArray[indexPath.row])
      //  brandCell.contentView.backgroundColor = UIColor.grayColor()
        return bannerCell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
