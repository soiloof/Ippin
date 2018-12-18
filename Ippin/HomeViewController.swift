//
//  HomeViewController.swift
//  Ippin
//
//  Created by 土屋光暉 on 2018/12/16.
//  Copyright © 2018 mitsuki.com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var ippinCollectionView: UICollectionView!
    var ippinArray = [["name":"豚骨ラーメン","image":UIImage(named: "noodle1.jpeg")],["name":"醤油ラーメン","image":UIImage(named: "noodle2.jpeg")],["name":"塩ラーメン","image":UIImage(named: "noodle3.jpeg")],["name":"味噌ラーメン","image":UIImage(named: "noodle4.jpeg")],["name":"油そば","image":UIImage(named: "noodle5.jpg")]]
    
    var selectedIppin:[String : Any] = [:]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        ippinCollectionView.dataSource=self
        ippinCollectionView.delegate=self

        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ippinCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IppinCell", for: indexPath)
        let ippinNameLabel = ippinCell.contentView.viewWithTag(1) as! UILabel
        ippinNameLabel.text = ippinArray[indexPath.row]["name"] as! String
        var ippinImage = ippinCell.contentView.viewWithTag(2) as! UIImageView
        ippinImage.image = ippinArray[indexPath.row]["image"] as! UIImage
       
        return ippinCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ippinArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIppin = ippinArray[indexPath.row]
        // DetailViewController へ遷移するために Segue を呼び出す
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.selectedIppin = selectedIppin
        
        
    }
    
   


}
