//
//  DetailViewController.swift
//  Ippin
//
//  Created by 土屋光暉 on 2018/12/17.
//  Copyright © 2018 mitsuki.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedIppin:[String:Any] = [:]
    @IBOutlet var ippinImage:UIImageView!
    @IBOutlet var ippinNameLabel:UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ippinImage.image = selectedIppin["image"] as! UIImage
        ippinNameLabel.text = selectedIppin["name"] as! String
        print(selectedIppin)
    }
    
    @IBAction func StoreIppin(){
 
    }

    

}
