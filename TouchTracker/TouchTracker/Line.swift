//
//  File.swift
//  TouchTracker
//
//  Created by Vo Huy on 5/18/18.
//  Copyright © 2018 Vo Huy. All rights reserved.
//

import UIKit
import CoreGraphics

struct Line {
    var begin = CGPoint.zero
    var end = CGPoint.zero
}

extension Line {
    var angle: Measurement<UnitAngle> {
        guard begin != end else {
            // if the line is a point
            return Measurement(value: 0.0, unit: .radians)
        }
        
        let dy = Double(end.y - begin.y)
        let dx = Double(end.x - begin.x)
        let angleInRadian : Measurement<UnitAngle> = Measurement(value: atan2(dy, dx), unit: .radians)
        return angleInRadian
    }
    
    var color : UIColor {
        let colors = [ UIColor.black, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.gray, UIColor.green, UIColor.lightGray, UIColor.magenta, UIColor.orange, UIColor.purple, UIColor.red, UIColor.yellow]
        let ratio = (self.angle.value + Double.pi) / (Double.pi * 2)    // First map angle in 0 ..< 2*pi
        let colorIndex = Int(Double(colors.count - 1) * ratio)
        return colors[colorIndex]
        
    }
    
    
}
