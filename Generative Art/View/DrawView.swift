//
//  DrawView.swift
//  Generative Art
//
//  Created by Caine Simpson on 4/24/20.
//  Copyright © 2020 Caine Simpson. All rights reserved.
//

import UIKit

class DrawView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = randomColor()
        //            draw()
        //            draw(view.frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func draw( _ rect: CGRect) {
        
        
        let step = Int.random(in: 0..<1000)
        
        print(step)
        let x = Int(bounds.origin.x)
        let y = Int(bounds.origin.y)
        
        let height = Int(bounds.height)
        let width = Int(bounds.width)
        
        for xvalue in stride(from: x, to: width, by: step) {
            for yvalue in stride(from: y, to: height, by: step) {
                drawLine(x: xvalue, y: yvalue, width: step, height: step)
            }
        }
    }
    
    func randomColor() -> UIColor {
        var r = Double.random(in: 0..<256)
        var g = Double.random(in: 0..<256)
        var b = Double.random(in: 0..<256)
        return UIColor(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: 1.0)
    }
    
    func drawLine(x: Int, y: Int, width: Int, height: Int) {
        let leftToRight: Bool = Bool.random()
        
        let path = UIBezierPath()
        
        let ranWidth = Int.random(in: 0...width)
        let ranHeight = Int.random(in: 0...height)
        
        
        if (leftToRight) {
            path.move(to: CGPoint(x: x, y: y))
            path.addLine(to: CGPoint(x: x + width, y: y + height))
            path.addLine(to: CGPoint(x: x + ranWidth, y: y + ranHeight))
        } else {
            path.move(to: CGPoint(x: x + ranWidth, y: y))
            path.addLine(to: CGPoint(x: x, y: y + height))
            path.addLine(to: CGPoint(x: x, y: y + ranHeight))
        }
        
        var ranColor = randomColor()
        print(ranColor)
        
        path.close()
//        ranColor.set()
        ranColor.setFill()
//        path.stroke()
//        path.stroke(with: .hardLight, alpha: 1.0)
        path.stroke()
        path.fill()
    }
    
    
//        func drawLine(x: Int, y: Int, width: Int, height: Int) {
//            let leftToRight: Bool = Bool.random()
//
//            let path = UIBezierPath()
//
//            let ranWidth = Int.random(in: 0..<width)
//            let ranHeight = Int.random(in: 0..<height)
//
//
//            if (leftToRight) {
//                path.move(to: CGPoint(x: x, y: y))
//                path.addLine(to: CGPoint(x: x + width, y: y + height))
//                path.addLine(to: CGPoint(x: x + ranWidth, y: y + ranHeight))
//            } else {
//                path.move(to: CGPoint(x: x + ranWidth, y: y))
//                path.addLine(to: CGPoint(x: x, y: y + height))
//                path.addLine(to: CGPoint(x: x, y: y + ranHeight))
//            }
//
//            var ranColor = randomColor()
//            print(ranColor)
//
//            path.close()
//    //        UIColor.green.setStroke()
//    //        UIColor.orange.setFill()
//    //        UIColor.cyan.setFill()
//            ranColor.set()
//    //        path.stroke()
//            path.stroke(with: .hardLight, alpha: 1.0)
//            path.fill()
//        }
    
    func drawCurve(x: Int, y: Int, width: Int, height: Int) {
        
        let leftToRight: Bool = Bool.random()

        let path = UIBezierPath()
        
        let width = CGFloat(width)
        let x = CGFloat(x / 10)
        let y = CGFloat(y / 10)
        let height = CGFloat(height)
        
        let ranWidth = CGFloat(Float.random(in: 1..<100))
        let ranHeight = CGFloat(Float.random(in: 1..<100))
        
        if (leftToRight) {
            path.move(to: CGPoint(x: x, y: y))
            path.addArc(withCenter: CGPoint(x: width / 2, y: height / 2), radius: 12, startAngle: 2.5, endAngle: 2.5, clockwise: true)
//            path.addLine(to: CGPoint(x: x + width, y: y + ranHeight))
//            path.addLine(to: CGPoint(x: x + ranWidth, y: y + ranHeight))
        } else {
            path.move(to: CGPoint(x: x + ranWidth, y: y))
            path.addArc(withCenter: CGPoint(x: width / 2, y: height / 2), radius: 12, startAngle: 2.5, endAngle: 2.5, clockwise: true)
//            path.addLine(to: CGPoint(x: x, y: y + height))
//            path.addLine(to: CGPoint(x: x, y: y + ranHeight))
        }
        
        
        
        
        
//        path.addCurve(to: width, controlPoint1: x, controlPoint2: y)
        let movePath = CGPoint(x: x, y: y)
        path.move(to: movePath)
//        path.addCurve(to: movePath, controlPoint1: CGPoint(x: x, y: y), controlPoint2: CGPoint(x: width, y: height))
        path.addArc(withCenter: CGPoint(x: width / 2, y: height / 2), radius: 12, startAngle: 2.5, endAngle: 2.5, clockwise: true)
//        path.addClip()
        path.close()
//        UIColor.blue.set()
        let color = randomColor()
        color.set()
        path.stroke()
        path.fill()
    }
}
