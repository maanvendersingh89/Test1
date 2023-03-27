//
//  SKMultilineLabelNode.swift
//  Magnetic
//
//  Created by Lasha Efremidze on 5/11/17.
//  Copyright © 2017 efremidze. All rights reserved.
//

import SpriteKit

@objcMembers open class SKMultilineLabelNode: SKNode {
    
    open var text: String? { didSet { update() } }
    
    open var fontName: String? { didSet { update() } }
    open var fontSize: CGFloat = 32 { didSet { update() } }
    open var fontColor: UIColor? { didSet { update() } }
    open var isExpired: Bool? { didSet { update() } }
    
    open var separator: String? { didSet { update() } }
    
    open var verticalAlignmentMode: SKLabelVerticalAlignmentMode = .baseline { didSet { update() } }
    open var horizontalAlignmentMode: SKLabelHorizontalAlignmentMode = .center { didSet { update() } }
    
    open var lineHeight: CGFloat? { didSet { update() } }
    open var cornerRadius: CGFloat? { didSet { update() } }
    open var width: CGFloat! { didSet { update() } }
    
    func update() {
        self.removeAllChildren()
        
        guard let text = text else { return }
        
        var stack = Stack<String>()
        var sizingLabel = makeSizingLabel()
        let words = separator.map { text.components(separatedBy: $0) } ?? text.map { String($0) }
        for (index, word) in words.enumerated() {
            sizingLabel.text += word
            if sizingLabel.frame.width > width, index > 0 {
                stack.add(toStack: word)
                sizingLabel = makeSizingLabel()
            } else {
                stack.add(toCurrent: word)
            }
        }
        
        let lines = stack.values.map { $0.joined(separator: separator ?? "") }
        for (index, line) in lines.enumerated() {
            let label = SKLabelNode(fontNamed: fontName)
           
            label.text = line
            label.fontSize = fontSize
            label.fontColor = fontColor
            label.verticalAlignmentMode = verticalAlignmentMode
            label.horizontalAlignmentMode = horizontalAlignmentMode
            
//            if isExpired ?? false {
//                label.text = "Expired"
//                let y = (CGFloat(index) - (CGFloat(lines.count) / 2) + 0.5) * -(lineHeight ?? fontSize)+20
//                label.position = CGPoint(x: 0, y: y)
//                let shape = SKShapeNode()
//                shape.path = UIBezierPath(roundedRect: CGRect(x:(label.frame.origin.x) - 10, y: (label.frame.origin.y) - 5, width: ((label.frame.size.width)+20), height: ((label.frame.size.height) + 10 )), cornerRadius: 64).cgPath
//                    shape.position = CGPoint(x: frame.midX, y: frame.midY)
//                shape.fillColor = UIColor.red
////                    shape.strokeColor = UIColor.blue
//            shape.lineWidth = 0.5
//            self.addChild(shape)
//            }
             if line.checkStingIsInt() {
                 if isExpired ?? false{
                     label.text = "Expired"
                     let y = (CGFloat(index) - (CGFloat(lines.count) / 2) + 0.5) * -(lineHeight ?? fontSize)+20
                     label.position = CGPoint(x: 0, y: y)
                     let shape = SKShapeNode()
                     shape.path = UIBezierPath(roundedRect: CGRect(x:(label.frame.origin.x) - 10, y: (label.frame.origin.y) - 5, width: ((label.frame.size.width)+20), height: ((label.frame.size.height) + 10 )), cornerRadius: 64).cgPath
                     shape.position = CGPoint(x: frame.midX, y: frame.midY)
                     shape.fillColor = UIColor.red
                     //                    shape.strokeColor = UIColor.blue
                     shape.lineWidth = 0
                     self.addChild(shape)
                 }
                 else{
                     let y = (CGFloat(index) - (CGFloat(lines.count) / 2) + 0.5) * -(lineHeight ?? fontSize)+20
                     label.position = CGPoint(x: 0, y: y)
                     let shape = SKShapeNode()
                     shape.path = UIBezierPath(roundedRect: CGRect(x:(label.frame.origin.x) - 10, y: (label.frame.origin.y) - 5, width: ((label.frame.size.width)+20), height: ((label.frame.size.height) + 10 )), cornerRadius: 64).cgPath
                         shape.position = CGPoint(x: frame.midX, y: frame.midY)
                         shape.fillColor = UIColor.clear
                         shape.strokeColor = UIColor.lightText
                     shape.lineWidth = 0.8
                     self.addChild(shape)
                 }
               
            }
            else if line.lowercased() == "you" {
                let y = (CGFloat(index) - (CGFloat(lines.count) / 2) + 0.5) * -(lineHeight ?? fontSize)
                label.position = CGPoint(x: 0, y: y)
            }
            else{
                let y = (CGFloat(index) - (CGFloat(lines.count) / 2) + 0.5) * -(lineHeight ?? fontSize)-10
                label.position = CGPoint(x: 0, y: y)
            }
            
            self.addChild(label)
        }
    }
    
    private func makeSizingLabel() -> SKLabelNode {
        let label = SKLabelNode(fontNamed: fontName)
        label.fontSize = fontSize
        return label
    }
    
}

private struct Stack<U> {
    typealias T = (stack: [[U]], current: [U])
    private var value: T
    var values: [[U]] {
        return value.stack + [value.current]
    }
    init() {
        self.value = (stack: [], current: [])
    }
    mutating func add(toStack element: U) {
        self.value = (stack: value.stack + [value.current], current: [element])
    }
    mutating func add(toCurrent element: U) {
        self.value = (stack: value.stack, current: value.current + [element])
    }
}

private func +=(lhs: inout String?, rhs: String) {
    lhs = (lhs ?? "") + rhs
}
