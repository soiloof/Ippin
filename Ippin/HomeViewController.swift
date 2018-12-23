//
//  HomeViewController.swift
//  Ippin
//
//  Created by 土屋光暉 on 2018/12/16.
//  Copyright © 2018 mitsuki.com. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,CLLocationManagerDelegate {
    
    //collectionview
    @IBOutlet var ippinCollectionView: UICollectionView!


    //ippinの格納場所
    var ippinData:[(name:String, image:UIImage, evaluation:Double, restaurant:String, price:Int, place:String, lat:Double, lng:Double)] = []
    
    
    //画面遷移後に受け渡す情報
   var selectedIppin:[(name:String, image:UIImage, evaluation:Double, restaurant:String, price:Int, place:String, lat:Double, lng:Double)] = []
    
    //GPS
    var lat:Double = 0
    var lng:Double = 0
    var locationManager: CLLocationManager!
    let motionManager = CMMotionManager()
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var lngTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //collecionviewのメソッドの呼び出し
        ippinCollectionView.dataSource=self
        ippinCollectionView.delegate=self
        
        //GPS
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self as! CLLocationManagerDelegate
            locationManager.startUpdatingLocation()
        }

        //ippinDataにデータを取得して格納する
        ippinData.append((name: "豚骨らーめん", image: UIImage(named: "noodle1.jpeg")!, evaluation: 3.2, restaurant: "一蘭", price: 750, place: "吉祥寺駅から徒歩5分", lat: 135.4, lng: 50.0))
        ippinData.append((name: "醤油らーめん", image: UIImage(named: "noodle2.jpeg")!, evaluation: 4.6, restaurant: "一蘭", price: 750, place: "吉祥寺駅から徒歩7分", lat: 135.4, lng: 50.0))
        ippinData.append((name: "塩らーめん", image: UIImage(named: "noodle3.jpeg")!, evaluation: 2.7, restaurant: "一蘭", price: 750, place: "吉祥寺駅から徒歩9分", lat: 135.4, lng: 50.0))
        ippinData.append((name: "味噌らーめん", image: UIImage(named: "noodle4.jpeg")!, evaluation: 3, restaurant: "一蘭", price: 750, place: "吉祥寺駅から徒歩2分", lat: 135.4, lng: 50.0))
        ippinData.append((name: "油そば", image: UIImage(named: "noodle5.jpg")!, evaluation: 3.9, restaurant: "一蘭", price: 750, place: "吉祥寺駅から徒歩3分", lat: 135.4, lng: 50.0))
        
   
        print(ippinData[2]) //Tanaka
        
    }
    
    //cellの内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ippinCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IppinCell", for: indexPath)
        let ippinNameLabel = ippinCell.contentView.viewWithTag(1) as! UILabel
        ippinNameLabel.text = ippinData[indexPath.row].name 
        let ippinImage = ippinCell.contentView.viewWithTag(2) as! UIImageView
        ippinImage.image = ippinData[indexPath.row].image 
        let ippinEvaluation = ippinCell.contentView.viewWithTag(3) as! UILabel
        ippinEvaluation.text = "★★★" + String(ippinData[indexPath.row].evaluation)
        let ippinRestaurant = ippinCell.contentView.viewWithTag(4) as! UILabel
        ippinRestaurant.text = ippinData[indexPath.row].restaurant 
        let ippinPrice = ippinCell.contentView.viewWithTag(5) as! UILabel
        ippinPrice.text = String(ippinData[indexPath.row].price)
        let ippinPlace = ippinCell.contentView.viewWithTag(6) as! UILabel
        ippinPlace.text = ippinData[indexPath.row].place
        
       
        return ippinCell
    }
    
    //cellの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ippinData.count
    }
    
    //cellを選択した際に呼び出される関数
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIppin = [ippinData[indexPath.row]]
        // DetailViewController へ遷移するために Segue を呼び出す
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    //画面遷移時に値を受け渡すための関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.selectedIppin = selectedIppin
    }
    
    //GPS現在地の取得
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
    }
    
    //GPS
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last,
            CLLocationCoordinate2DIsValid(newLocation.coordinate) else {
                self.latTextField.text = "Error"
                self.lngTextField.text = "Error"
                return
        }
        
        self.latTextField.text = "".appendingFormat("%.4f", newLocation.coordinate.latitude)
        lat = newLocation.coordinate.latitude
        self.lngTextField.text = "".appendingFormat("%.4f", newLocation.coordinate.longitude)
        lng = newLocation.coordinate.longitude
    }
   


}
