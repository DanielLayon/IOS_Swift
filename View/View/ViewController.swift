//
//  ViewController.swift
//  View
//
//  Created by user210282 on 12/1/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var lngLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var lat = ""
    var lng = ""
    var spd = ""
    var resp = ""
    
    var locationMode = 0
    var timer = Timer()
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        	
        self.locationManager.requestAlwaysAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                }
            }
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.last {
            
            lat = String(location.coordinate.latitude)
            lng = String(location.coordinate.longitude)
            spd =  String(location.speed)
            
            latLabel.text = "Latitude: \(String(lat))"
            lngLabel.text = "Longitude: \(String(lng))"
            speedLabel.text = "Velocidade: \(String(spd))"
            // Handle location update
        }
    }

    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        // Handle failure to get a user’s location
    }
    	
    @IBAction func requestLocation(_ sender: Any) {
        
        if locationMode == 0{
            locationMode = 1
            textView.text = """
                            Serviço Ativado
                            """
            
            sendRequest()
            
        }else if locationMode == 1{
            locationMode = 0
            timer.invalidate()
            textView.text = """
                            Serviço Desativado
                            """
        }
        
    }
    
    func sendRequest(){
        
        if locationMode == 0{
            timer.invalidate()
            
        }else if locationMode == 1{
            timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(sendToServer), userInfo: nil, repeats: true)
        }
    }
    
    @objc func sendToServer(){
        var date = Date()
        var dateFormat = DateFormatter()
        
        dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><Set_PosicaoGPS xmlns=\"http://tempuri.org/\"><GPS><sToken>a01c5bc37332270bde0d5cfe528e3e6b</sToken><sCPF>14526849600</sCPF><nLatitude>\(lat)</nLatitude><nLongitude>\(lng)</nLongitude><dDtGeracao>\(dateFormat.string(from: date))</dDtGeracao><sUF></sUF><sCidade></sCidade><sLogradouro></sLogradouro><sReferencia></sReferencia><nVelocidade>\(spd)</nVelocidade></GPS></Set_PosicaoGPS></soap:Body></soap:Envelope>"
        
        let url = URL(string: "http://www.noxgr.srv.br/NOXAppService/AppWebService.wso")
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url!)
        request.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("text/xml; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = xml.data(using: .utf8)
        
        let task = session.dataTask(with: request) {
            (data, response, error) in
        
            
            
            self.resp = """
                            Request:
                                    \(xml)
                            
                            Response:
                                    \(String(data: data!, encoding: String.Encoding.utf8))
                    """
            
        }
        
        task.resume()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(updateText), userInfo: nil, repeats: false)
    }
    
    @objc func updateText(){
        self.textView.text = self.resp
    }
    
    
    
}




