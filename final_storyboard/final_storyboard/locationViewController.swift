//
//  locationViewController.swift
//  final_storyboard
//
//  Created by Pippa Lother on 4/11/22.
//

import UIKit
import CoreLocation
import MapKit

class locationViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        mapView.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        //let region = MKCoordinateRegion(center: myCurrLocation, span: span) //define currlocation
        //mapView.setRegion(region, animated: true)
    }
    // MARK: CoreLocation Delegate Methods

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse || status == .authorizedAlways{
            //print("APP auth")
            locationManager.startUpdatingLocation()
        }
        if status == .notDetermined || status == .denied{
            //need to fix this to take them back to the main screen
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocation locations: [CLLocation]) {
        
        //get info you need here from GPS or wherever the location is
        
        locationManager.stopUpdatingLocation()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
