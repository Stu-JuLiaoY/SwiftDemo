//
//  LocationViewController.swift
//  SwiftDemo
//
//  Created by Ju Liaoyuan on 2017/8/23.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    
    let locationLabel = UILabel()
    var address = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        createView()
        configureLocationManager()
        // Do any additional setup after loading the view.
    }
    
    override func createView() {
        let tipsLabel = UILabel.init(frame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 40))
        tipsLabel.text = "Location"
        tipsLabel.font = UIFont.systemFont(ofSize: 15)
        tipsLabel.textAlignment = .center
        tipsLabel.isUserInteractionEnabled = true
        self.view.addSubview(tipsLabel)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(startLocation))
        tipsLabel.addGestureRecognizer(tap)
        
        locationLabel.frame = CGRect(x: 0, y: 200, width: self.view.bounds.width, height: 40)
        locationLabel.font = UIFont.systemFont(ofSize: 15)
        locationLabel.textAlignment = .center
        locationLabel.numberOfLines = 0
        view.addSubview(locationLabel)
    }
    
    func configureLocationManager() {
        locationManager.delegate = self
        
    }
    
    func startLocation() {
        
        let state = CLLocationManager.authorizationStatus()
        
        switch state {
        case .denied:
            print("Emmmmmm~~~")
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let currrentLocation = locations.last!
        let lat = "lat: \(currrentLocation.coordinate.latitude)"
        let long = "long: \(currrentLocation.coordinate.longitude)"
        geocoder.reverseGeocodeLocation(currrentLocation) { (placeMark, error) in
            if error == nil {
                let location = placeMark?.first!
                let country = location?.country
                let city = location?.locality
                let subCity = location?.subLocality
                self.address = lat + long + country! + city! + subCity!
                self.locationLabel.text = self.address
            } else {
                print(error!)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
