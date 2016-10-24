//
//  testViewController.swift
//  Giraffe
//
//  Created by YANGSHENG ZOU on 2016-07-09.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    let bannerCollectionViewCellReuseIdentifier = "image"
    let bannerStringArray = ["home_page_top_banner_01","home_page_top_banner_02","home_page_top_banner_03"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollectionView.register(UINib.init(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: bannerCollectionViewCellReuseIdentifier)
        
        
        print(bannerCollectionView.frame.width)
        
        /*
        
        bannerScrollView.contentSize = CGSizeMake(bannerScrollView.bounds.width * CGFloat(bannerStringArray.count), bannerScrollView.bounds.height)
        for i in 0..<bannerStringArray.count {
            let bannerImageView = UIImageView.init(frame: CGRect(x: bannerScrollView.bounds.width * CGFloat(i), y: 0, width: bannerScrollView.bounds.width , height: bannerScrollView.bounds.height))
            bannerImageView.image = UIImage.init(named: bannerStringArray[i])
            bannerImageView.contentMode = UIViewContentMode.ScaleAspectFit
            bannerScrollView.addSubview(bannerImageView)
            //print(bannerImageView.bounds)
        }

        // Do any additional setup after loading the view.
 
 */
    }
    
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:IndexPath) -> CGSize{
        
        return CGSize(width: collectionView.bounds.width-16, height: collectionView.bounds.height)
    }
    
    
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return bannerStringArray.count
    }
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell{
        
        let bannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCollectionViewCellReuseIdentifier, for:indexPath) as! BannerCollectionViewCell
        bannerCollectionViewCell.bannerImageView.image = UIImage.init(named: bannerStringArray[indexPath.row])
       // bannerCollectionView.backgroundView?.clipsToBounds = true
        print(bannerCollectionView.bounds.width)
        // bannerCollectionViewCell.contentView.backgroundColor = UIColor.grayColor()
        return  bannerCollectionViewCell
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
