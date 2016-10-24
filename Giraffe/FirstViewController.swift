//
//  FirstViewController.swift
//  Giraffe
//
//  Created by YANGSHENG ZOU on 2016-07-09.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var homeTableView: UITableView!

    let bannerCellReuseIdentifier = "banner"
    let saleCellReuseIdentifier = "sale"
    let productCellReuseIdentifier = "product"
    let bannerRatio = 2550.0/1734.0
    let productRatio = 2500.0 / 1120.0
    let saleRatio = 345.0 / 116.0
    
   // let bannerStringArray = ["home_page_top_banner_01","home_page_top_banner_02","home_page_top_banner_03"]
    
    let productImageNameArray = ["home_page_product_01","home_page_product_02","home_page_product_03"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        homeTableView.registerNib(UINib.init(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: bannerCellReuseIdentifier)
        homeTableView.registerNib(UINib.init(nibName: "SaleCell", bundle: nil), forCellReuseIdentifier: saleCellReuseIdentifier)

        homeTableView.registerNib(UINib.init(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: productCellReuseIdentifier)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableview: UITableView,
                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return tableview.bounds.width / CGFloat(bannerRatio)
        case 1:
            return tableview.bounds.width / CGFloat(saleRatio)
        default:
            return tableview.bounds.width / CGFloat(productRatio)
        }
    }
    
    func tableView(tableView: UITableView,
                   didSelectRowAtIndexPath indexPath: NSIndexPath){
        showOrderViewController()
        
        //Todo: set different imageName array for each presenting view
        
    }
    
    func showOrderViewController() {
        let orderViewController = OrderViewController.init(nibName: "OrderViewController", bundle: nil, imageNameArray: ["product_pic_01","product_pic_02","product_pic_03","product_pic_04"], zoomImageNameArray: ["product_pic_clicked_zoom_out_01","product_pic_clicked_zoom_out_02","product_pic_clicked_zoom_out_03","product_pic_clicked_zoom_out_04"])
        presentViewController(orderViewController, animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView:UITableView!)->Int
    {
        return 2 + productImageNameArray.count
    }
    func tableView(_: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    func tableView(tablewview: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        switch indexPath.section {
        case 0:
            let bannerCell = tablewview.dequeueReusableCellWithIdentifier(bannerCellReuseIdentifier)
                as! BannerCell
            
            return bannerCell
        case 1:
            let saleCell = tablewview.dequeueReusableCellWithIdentifier(saleCellReuseIdentifier)
                as! SaleCell
            return saleCell
        default:
            let productCell = tablewview.dequeueReusableCellWithIdentifier(productCellReuseIdentifier) as! ProductCell
            productCell.productImageView.image = UIImage.init(named: productImageNameArray[indexPath.section - 2])
            return productCell
        }
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
