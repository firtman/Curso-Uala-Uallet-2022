//
//  InfoViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/30/22.
//

import UIKit
import Alamofire
import PromiseKit


class InfoViewController: UIViewController {

    @IBOutlet weak var activityLoading: UIActivityIndicatorView!
    @IBOutlet weak var lblCotizaciones: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leerCotizacion()
    }
    
    
    @IBAction func refresh(_ sender: Any) {
        leerCotizacion()
    }
    
    func constanteMultiplicacion() -> Promise<Double> {
        return Promise { resolver in
            resolver.fulfill(1)
        }
    }
    
    
    func leerCotizacion() {
        
        lblCotizaciones.text = ""
        activityLoading.startAnimating()

        firstly {
            when(fulfilled:
                    APICotizaciones.bitcoinRatePromises(),
                    APICotizaciones.dolarBlueRatePromises(),
                    constanteMultiplicacion()
            )
        }
        .done { cotizaciones in
            // Se cumplen LAS DOS promesas
            self.lblCotizaciones.text =
            """
            1 BTC = \(cotizaciones.0) USD
            1 USD = \(cotizaciones.1.compra) ARS
            """
        }
        .catch { error in
            self.lblCotizaciones.text = "Error 😬"
        }
        .finally {
            self.activityLoading.stopAnimating()
        }
        
        
        
//        APICotizaciones.bitcoinRatePromises()
//            .done { rate in
//                // Se cumplió
//
//            }
//            .catch { error in
//                // No se cumplió
//
//            }
//

        
    
    }
    
    func leerCotizacionSinPromises() {
        lblCotizaciones.text = ""
        activityLoading.startAnimating()
        
        
        // APIs en secuencia
        APICotizaciones.dolarBlueRate { ok, rateUSD in
            APICotizaciones.bitcoinRate { ok, rateBTC in
                self.activityLoading.stopAnimating()
                if (ok) {
                    self.lblCotizaciones.text =
                        """
                            1 BTC = \(rateBTC!) USD
                            1 USD = \(rateUSD!) ARS
                        """
                    
                } else {
                    self.lblCotizaciones.text = "Error 😬"
                }
            }
        }
    }
    
//    func leerCotizacionAMano() {
//        AF.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON { http in
//            if let body = http.value {
//                if let json = body as? [String: Any] {
//                    let disclaimer = json["disclaimer"] as! String
//                    debugPrint(disclaimer)
////              as? = aceptás que no se pueda castear y que sea nulo
////              as! = solo aceptamos que existe y se puede caster
//                    let bpi = json["bpi"] as! [String: Any]
//                    let usd = bpi["USD"] as! [String: Any]
//                    let rate = usd["rate_float"] as! Double
//                    print("El bitcoin vale $\(rate)")
//                    
//                }
//                
//            } else {
//                print("No hay body")
//            }
//        }
//        
//    }


}
