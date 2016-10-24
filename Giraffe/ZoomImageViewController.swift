//
//  zoomImageViewController.swift
//  Giraffe
//
//  Created by YANGSHENG ZOU on 2016-07-10.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class ZoomImageViewController: UIViewController {
    
    @IBOutlet weak var zoomImageView: UIImageView!
    
    var zoomImageName: String
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, imageName:String!) {
        self.zoomImageName = imageName
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomImageView.image = UIImage.init(named: zoomImageName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissSelf(sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
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
