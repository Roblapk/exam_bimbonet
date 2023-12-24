//
//  Network.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 24/12/23.
//

import Foundation
import Network

class Network: ObservableObject{
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitoring")
    @Published var connected: Bool = false
    
    var connectionDescription: String{
        if connected{
            return "Hay conecxión a internet "
        }else{
            return "Parece que no tienes conexión a internet"
        }
    }
    
    init(){
        checkConnection()
    }
    
    func checkConnection() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                if path.status == .satisfied{
                    self?.connected = true
                }else{
                    self?.connected = false
                }
            }
        }
        monitor.start(queue: queue)
    }
    
}
