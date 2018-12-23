//
//  DetailViewController.swift
//  Ippin
//
//  Created by 土屋光暉 on 2018/12/17.
//  Copyright © 2018 mitsuki.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedIppin:[(name:String, image:UIImage, evaluation:Double, restaurant:String, price:Int, place:String, lat:Double, lng:Double)]!
    @IBOutlet var ippinImage:UIImageView!
    @IBOutlet var ippinNameLabel:UILabel!
    @IBOutlet var ippinEvaluationLabel:UILabel!
    @IBOutlet var ippinRestaurantNameLabel:UILabel!
    @IBOutlet var ippinPriceLabel:UILabel!
    @IBOutlet var ippinPlaceLabel:UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if selectedIppin != nil{
            ippinImage.image = selectedIppin[0].image
            ippinNameLabel.text = selectedIppin[0].name
            ippinEvaluationLabel.text = "★★★"+String(selectedIppin[0].evaluation)
            ippinRestaurantNameLabel.text = selectedIppin[0].restaurant
            ippinPriceLabel.text = String(selectedIppin[0].price)
            ippinPriceLabel.text = selectedIppin[0].place
        }

    }
    
    @IBAction func StoreIppin(){
 
    }

    

}
