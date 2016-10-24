//
//  BannerCell.swift
//  Giraffe
//
//  Created by YANGSHENG ZOU on 2016-07-09.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class BannerCell: UITableViewCell,UIScrollViewDelegate {


    @IBOutlet weak var bannerPageControl: UIPageControl!
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    let bannerCollectionViewCellReuseIdentifier = "image"
    
    
    let bannerImageNameArray = ["home_page_top_banner_01","home_page_top_banner_02","home_page_top_banner_03"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
     //   bannerPageControl.transform = CGAffineTransformMakeScale(1.5, 1.5);
         bannerCollectionView.register(UINib.init(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: bannerCollectionViewCellReuseIdentifier)
        // Initialization code
        bannerPageControl.numberOfPages = bannerImageNameArray.count
    }
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:IndexPath) -> CGSize{
        if collectionView.bounds.width > 400 {
            return CGSize(width: collectionView.bounds.width-24, height: collectionView.bounds.height)
        }
        return CGSize(width: collectionView.bounds.width-16, height: collectionView.bounds.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return bannerImageNameArray.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell{
        let bannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCollectionViewCellReuseIdentifier, for: indexPath) as! BannerCollectionViewCell
        bannerCollectionViewCell.bannerImageView.image = UIImage.init(named: bannerImageNameArray[(indexPath as NSIndexPath).row])
        // bannerCollectionView.backgroundView?.clipsToBounds = true
        
        // bannerCollectionViewCell.contentView.backgroundColor = UIColor.grayColor()
       // bannerPageControl.currentPage = indexPath.row
        return  bannerCollectionViewCell
    }
    
    func collectionView(_: UICollectionView,
                        didSelectItemAtIndexPath indexPath: IndexPath){
       
        let tabController = window?.rootViewController as! UITabBarController
        let currentViewController = tabController.viewControllers![0] as! FirstViewController
        currentViewController.showOrderViewController()
        //Todo: set Image for presenting product 
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        bannerPageControl.currentPage = Int(round(scrollView.contentOffset.x / scrollView.bounds.width))

    }
 
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
        bannerCollectionView.setContentOffset(CGPoint.init(x: bannerCollectionView.bounds.width * CGFloat(sender.currentPage), y: 0), animated: true)
    }
        
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
