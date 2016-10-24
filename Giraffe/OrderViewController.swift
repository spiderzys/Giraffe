//
//  orderViewController.swift
//  Giraffe
//
//  Created by YANGSHENG ZOU on 2016-07-10.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    @IBOutlet weak var selectedProductCollectionView: UICollectionView!
    
    @IBOutlet weak var productPageControl: UIPageControl!
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    
    var productZoomImageNameArray: [String]
    var productImageNameArray: [String];
    let productCellreuseIdentifier = "image"
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, imageNameArray: [String]!, zoomImageNameArray: [String]!) {
        self.productImageNameArray = imageNameArray
        self.productZoomImageNameArray = zoomImageNameArray
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productPageControl.numberOfPages = productImageNameArray.count
        modalTransitionStyle = .flipHorizontal
        descriptionTextView.text = "Kimomo dress in tafeta with \"Kimomo 1997\" print.\n -inner side pockets.\n -front warpround fastening with two tie laces and belt"
         selectedProductCollectionView.register(UINib.init(nibName: "BannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: productCellreuseIdentifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize{
        
        if collectionView.bounds.width > 400 {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
        }
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return productImageNameArray.count
    }
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: productCellreuseIdentifier, for: indexPath as IndexPath) as! BannerCollectionViewCell
        bannerCell.bannerImageView.image = UIImage.init(named: productImageNameArray[indexPath.row])
        bannerCell.bannerImageView.contentMode = .scaleAspectFill
        bannerCell.contentView.backgroundColor = UIColor.gray
        return bannerCell
    }
    
    func collectionView(_: UICollectionView,
                        didSelectItemAtIndexPath indexPath: NSIndexPath){
        let zoomImageViewController = ZoomImageViewController.init(nibName: "ZoomImageViewController", bundle: nil, imageName: productZoomImageNameArray[indexPath.row] )
        
        present(zoomImageViewController, animated: true, completion: nil)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        productPageControl.currentPage = Int(round(scrollView.contentOffset.x / scrollView.bounds.width))
        
    }

    @IBAction func dismissSelf(sender: UISwipeGestureRecognizer) {
        dismiss(animated: true, completion: {
            print(Thread())
        })
    }
    
    
    @IBAction func pageChanged(sender: AnyObject) {
        productCollectionView.setContentOffset(CGPoint.init(x: productCollectionView.bounds.width * CGFloat(sender.currentPage), y: 0), animated: true)

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
