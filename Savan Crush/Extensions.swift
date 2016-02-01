//
//  Extensions.swift
//  Savan Crush
//
//  Created by Bosc-Ducros Hugo on 31/01/2016.
//  Copyright © 2016 Bosc-Ducros Hugo. All rights reserved.
//

import Foundation

extension Dictionary {
    static func loadJSONFromBundle(filename: String) -> Dictionary<String, AnyObject>? {
        if let path = NSBundle.mainBundle().pathForResource(filename, ofType: "json") {
            
            //var error: NSError?
            let data:NSData!
            
            do {
                data = try NSData(contentsOfFile: path, options: NSDataReadingOptions())
            } catch  {
                //let error: NSError?
                data = NSData()
            }
            
            
            //let data = NSData(contentsOfFile: path, options: NSDataReadingOptions(), error: &error)
            if let data = data {
                
                let dictionary:NSDictionary!
                
                do {
                    dictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as! NSDictionary
                } catch {
                    //let error:NSError?
                    dictionary = NSDictionary()
                }
                
                
                //let dictionary: AnyObject? = NSJSONSerialization.JSONObjectWithData(data,
                //    options: NSJSONReadingOptions())
                if let dictionary = dictionary {
                    return dictionary as? Dictionary<String, AnyObject>
                } else {
                    print("Level file '\(filename)' is not valid JSON")
                    return nil
                }
            } else {
                print("Could not load level file: \(filename), error")
                return nil
            }
        } else {
            print("Could not find level file: \(filename)")
            return nil
        }
    }
}