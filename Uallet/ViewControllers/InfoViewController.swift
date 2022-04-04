//
//  InfoViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/30/22.
//

import UIKit
import Alamofire


class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        leerCotizacion()
    }
    
    func leerCotizacion() {
        AF.request("http://api.coindesk.com/v1/bpi/currentprice.json")
            .responseDecodable(of: APIDolarRespuesta.self) {
            response in
            
                if let value = response.value {
                    let rate = value.bpi.usd.rateFloat
                    print("El bitcoin vale $\(rate)")
                } else {
                    print("Hubo un error")
                }
                
        }
    }
    
    func leerCotizacionAMano() {
        AF.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { http in
            if let body = http.value {
                if let json = body as? [String: Any] {
                    let disclaimer = json["disclaimer"] as! String
                    debugPrint(disclaimer)
//              as? = aceptás que no se pueda castear y que sea nulo
//              as! = solo aceptamos que existe y se puede caster
                    let bpi = json["bpi"] as! [String: Any]
                    let usd = bpi["USD"] as! [String: Any]
                    let rate = usd["rate_float"] as! Double
                    print("El bitcoin vale $\(rate)")
                    
                }
                
            } else {
                print("No hay body")
            }
        }
        
    }


}
