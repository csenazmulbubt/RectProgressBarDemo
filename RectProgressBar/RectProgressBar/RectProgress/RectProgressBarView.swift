//
//  RectProgressBarVIew.swift
//  RectProgressBar
//
//  Created by Nazmul on 02/04/2022.
//

import UIKit

class RectProgressBarView: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var rectProgressView: UIView!
    @IBOutlet weak var percentageShowLabel: UILabel!
    
    var storkeLayer: CAShapeLayer?
    var isFirst = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !isFirst{
            self.layoutIfNeeded()
            self.isFirst = true
            self.progressBarInitial()
        }
    }
    
    fileprivate func commonInit() {
        Bundle.main.loadNibNamed("RectProgressBarView", owner: self, options: nil)
        self.containerView.frame = self.bounds
        self.containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.rectProgressView.layer.cornerRadius = 5
        self.addSubview(self.containerView)
    }
    
    func progressBarInitial() -> Void {
        
        self.rectProgressView.removeSublayer(layerName: "progressLayer")
        let cornerRadius:CGFloat = 5.0
        let demoPath = UIBezierPath()
        //start path
        demoPath.move(to: CGPoint(x: rectProgressView.bounds.width/2.0, y: 0.0))
        
        //mid top right
        demoPath.addLine(to: CGPoint(x:  self.rectProgressView.bounds.width - cornerRadius, y: 0.0))
        demoPath.addArc(withCenter: CGPoint(x:  self.rectProgressView.bounds.width - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: 3 * .pi / 2, endAngle: 0, clockwise: true) // Add top right rounded corner
        
        //bottom right
        demoPath.addLine(to: CGPoint(x:  self.rectProgressView.bounds.width, y: rectProgressView.bounds.height - cornerRadius))
        demoPath.addArc(withCenter: CGPoint(x:  self.rectProgressView.bounds.width - cornerRadius, y: rectProgressView.bounds.height - cornerRadius), radius: cornerRadius, startAngle: 0, endAngle: .pi / 2, clockwise: true) // Add bottom right rounded corner
        
        //bottom right to bottom left
        demoPath.addLine(to: CGPoint(x: cornerRadius, y:  self.rectProgressView.bounds.height))
        demoPath.addArc(withCenter: CGPoint(x: cornerRadius, y:  self.rectProgressView.bounds.height - cornerRadius), radius: cornerRadius, startAngle: .pi / 2, endAngle: .pi, clockwise: true) // Add bottom left rounded corner
        //top left
        demoPath.addLine(to: CGPoint(x: 0.0, y: cornerRadius))
        demoPath.addArc(withCenter: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: .pi, endAngle: 3 * .pi / 2, clockwise: true) // Add top left rounded corner
        demoPath.addLine(to: CGPoint(x:  self.rectProgressView.bounds.width/2.0, y: 0.0))
        demoPath.close()
        
        storkeLayer = CAShapeLayer()
        storkeLayer?.name = "progressLayer"
        storkeLayer?.fillColor = UIColor.clear.cgColor
        storkeLayer?.strokeColor = UIColor.red.cgColor
        storkeLayer?.lineWidth = 3
        storkeLayer?.path = demoPath.cgPath
        storkeLayer?.strokeEnd = 0
        storkeLayer?.speed = 1
        rectProgressView.layer.addSublayer(storkeLayer!)
    }
    
    var updatingProgressBar: CGFloat = 0.0{
        didSet{
            self.storkeLayer?.strokeEnd = updatingProgressBar
        }
    }
    
    var percentage: String = ""{
        didSet{
            self.percentageShowLabel.text = percentage
        }
    }
    
    func updatingProgressBar (progress: CGFloat)-> Void {
        self.storkeLayer?.strokeEnd = CGFloat(progress)
    }
}


extension UIView{
    func removeSublayer(layerName: String) -> Void {
        self.layer.sublayers?
            .filter { $0.name == layerName }
            .forEach { $0.removeFromSuperlayer() }
    }
}
