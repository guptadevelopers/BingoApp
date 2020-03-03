//
//  MapViewController.swift
//  BingoApp
//
//  Created by Coach USA on 03/03/20.
//  Copyright © 2020 Coach USA Learning. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyB1KGUP3r_i1ET2UymtrrAOnRNKbeSrJ-A")

        // Do any additional setup after loading the view.
        
        // Create a GMSCameraPosition that tells the map to display the
           // coordinate -33.86,151.20 at zoom level 6.
           let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
           let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
           self.view.addSubview(mapView)
        //view=mapView

           // Creates a marker in the center of the map.
           let marker = GMSMarker()
           marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
           marker.title = "Sydney"
           marker.snippet = "Australia"
           marker.map = mapView
    }
    

    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
