//
//  AnimatedClockView.swift
//  AnimatedClockView
//
//  Created by Taleb on 9/18/19.
//  Copyright © 2019 Taleb. All rights reserved.
//

import Foundation

@IBDesignable
public class AnimatedClockView: UIView {
    
    private let clockCircleLayer = CAShapeLayer()
    private let bigHandLayer = CAShapeLayer()
    private let smallHandLayer = CAShapeLayer()
    
    @IBInspectable
    public var clockColor:UIColor = .black{
        didSet {setNeedsDisplay()}
    }
    
    @IBInspectable
    public var animate: Bool = true {
        didSet {animateClock()}
    }
    
    
    
    public override func draw(_ rect: CGRect) {
        drawClock()
    }
    
    private func drawClock() {
        let centerPoint = CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
        let squreWidth:CGFloat = min(bounds.width, bounds.height)
        let strokeWidth:CGFloat = squreWidth*0.05
        let circleRadius:CGFloat = (squreWidth/2.0) - strokeWidth
        
        let clockCirclePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: 0.0, endAngle: 360.0, clockwise: true)
        
        clockCircleLayer.path = clockCirclePath.cgPath
        clockCircleLayer.fillColor = UIColor.clear.cgColor
        clockCircleLayer.strokeColor = clockColor.cgColor
        clockCircleLayer.lineWidth = strokeWidth
        
        if clockCircleLayer.superlayer == nil {
         self.layer.addSublayer(clockCircleLayer)
        }
        //
        let bigHandRadius = circleRadius - (2.0 * strokeWidth)
        let bigHandPath = UIBezierPath()
        bigHandPath.move(to: .zero)
        bigHandPath.addLine(to: CGPoint(x: 0, y: -bigHandRadius))
        bigHandLayer.path = bigHandPath.cgPath
        bigHandLayer.strokeColor = clockColor.cgColor
        bigHandLayer.lineWidth = strokeWidth
        bigHandLayer.lineCap = .round
        bigHandLayer.position = centerPoint
        
        if bigHandLayer.superlayer == nil {
         self.layer.addSublayer(bigHandLayer)
        }
        //
        let smallHandRadius = 2 * bigHandRadius / 3
        let smallHandPath = UIBezierPath()
        smallHandPath.move(to: .zero)
        smallHandPath.addLine(to: CGPoint(x: 0, y: -smallHandRadius))
        //

        smallHandLayer.path = smallHandPath.cgPath
        smallHandLayer.strokeColor = clockColor.cgColor
        smallHandLayer.lineWidth = strokeWidth
        smallHandLayer.lineCap = .round
        smallHandLayer.position = centerPoint

        self.layer.addSublayer(smallHandLayer)
    }
    
    private func animateClock() {
        if animate {
            if bigHandLayer.animation(forKey: "time") == nil {
                addNeedleLayerAnimation()
            }else if bigHandLayer.speed == 0 {
                resumeLayer(layer: bigHandLayer)
                resumeLayer(layer: smallHandLayer)
            }
        }else {
            stopAnimateClock()
        }
    }
    
    private func stopAnimateClock() {
        pauseLayer(layer: bigHandLayer)
        pauseLayer(layer: smallHandLayer)
    }
    
    private func pauseLayer(layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }
    
    private func resumeLayer(layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
    
    
    private func addNeedleLayerAnimation() {
        bigHandLayer.speed = 1.0
        bigHandLayer.timeOffset = 0.0
        bigHandLayer.beginTime = 0.0
        //
        smallHandLayer.speed = 1.0
        smallHandLayer.timeOffset = 0.0
        smallHandLayer.beginTime = 0.0
        //
        let bigHandAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        bigHandAnimation.duration = 0.6
        bigHandAnimation.fromValue = 0
        bigHandAnimation.toValue = Float.pi * 2
        bigHandAnimation.repeatCount = .greatestFiniteMagnitude
        bigHandLayer.add(bigHandAnimation, forKey: "time")
        //
        let smallHandAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        smallHandAnimation.duration = 0.6*12
        smallHandAnimation.fromValue = 0
        smallHandAnimation.toValue = Float.pi * 2
        smallHandAnimation.repeatCount = .greatestFiniteMagnitude
        smallHandLayer.add(smallHandAnimation, forKey: "time")
    }
    
    
    public func resetClock() {
        animate = false
        bigHandLayer.removeAllAnimations()
        smallHandLayer.removeAllAnimations()
    }
    
}
