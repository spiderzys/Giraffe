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
    
    @IBOutlet weak var brandTableView: UITableView!
 //   @IBOutlet weak var displaySegmentedControl: UISegmentedControl!
    
    let brandCellReuseIdentifier = "brand"
   // let brandTableCellReuseIdentifier = "brand2"
    var brandImageNameArray = ["apple","BeatsDrDre","Burberry","Chanel","Fendi","Huawei","intel","jordan","playstation","Samsung","ssense","Xbox"]
    
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
        if sender.selectedSegmentIndex == 0{
            sender.setImage(UIImage.init(named: "view_brand_by_logo_icon_clicked"), forSegmentAtIndex: 0)
            sender.setImage(UIImage.init(named: "view_brand_by_name_icon"), forSegmentAtIndex: 1)
            brandTableView.hidden = true
            brandCollectionView.hidden = false
        }
        else {
            sender.setImage(UIImage.init(named: "view_brand_by_logo_icon"), forSegmentAtIndex: 0)
            sender.setImage(UIImage.init(named: "view_brand_by_name_icon_clicked"), forSegmentAtIndex: 1)
            brandTableView.hidden = false
            brandCollectionView.hidden = true
        }
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize{
        
        if collectionView.bounds.width > 400 {
            return CGSizeMake(collectionView.bounds.width/3.0-8, collectionView.bounds.width/3.0-8)
        }
        
        return CGSizeMake(collectionView.bounds.width/3.0-5.4, collectionView.bounds.width/3.0-5.4)
    }
    
        
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int{
        return brandImageNameArray.count
    }
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let brandCell = collectionView.dequeueReusableCellWithReuseIdentifier(brandCellReuseIdentifier, forIndexPath: indexPath) as! BrandCollectionViewCell
        brandCell.brandImageView.image = UIImage.init(named: brandImageNameArray[indexPath.row])
        brandCell.contentView.backgroundColor = UIColor.grayColor()
        return brandCell
    }
    
    
    func tableView(tableview: UITableView,
                   heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    
        return 40
    }
    
    func tableView(tableView: UITableView,
                   didSelectRowAtIndexPath indexPath: NSIndexPath){
        
    }
    
    func tableView(_: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return brandImageNameArray.count
    }
    
    func tableView(tablewview: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var brandCell = tablewview.dequeueReusableCellWithIdentifier(brandCellReuseIdentifier)
        if brandCell == nil {
             brandCell = UITableViewCell.init(style: .Default, reuseIdentifier: brandCellReuseIdentifier)
        }
        brandCell?.textLabel?.text = brandImageNameArray[indexPath.row]
        return brandCell!
    }
}

