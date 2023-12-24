//
//  Globals.swift
//  exam_bimboNet
//
//  Created by Rogelio B on 23/12/23.
//

import Foundation

class Globals{
    
    static let shared = Globals()
    
    //2020-06-30T19:55:00.000Z
    func changeDateFormat(dateUtc: String) -> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: dateUtc){
            let convertDateFormatter = DateFormatter()
            convertDateFormatter.dateFormat = "EEEE, MMMM d ',' yyyy"
            
            let newdate = convertDateFormatter.string(from: date)
            //print(newdate)
            
            return newdate
        }
        return "Hubo un error en la fecha"
    }
    
}
