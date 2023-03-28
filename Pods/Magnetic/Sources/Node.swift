//
//  Node.swift
//  Magnetic
//
//  Created by Lasha Efremidze on 3/25/17.
//  Copyright © 2017 efremidze. All rights reserved.
//

import SpriteKit

@objcMembers open class Node: SKShapeNode {
    
    public lazy var label: SKMultilineLabelNode = { [unowned self] in
        let label = SKMultilineLabelNode()
        label.fontName = Defaults.fontName
        label.fontSize = CGFloat(15)
        label.fontColor = Defaults.fontColor
        label.verticalAlignmentMode = .center
        label.width = self.frame.width
        label.separator = " "
        label.isExpired = isExpired
        
        addChild(label)
        return label
    }()
    public lazy var label2: SKMultilineLabelNode = { [unowned self] in
        let label2 = SKMultilineLabelNode()
        label2.fontName = Defaults.fontName
        label2.fontSize = Defaults.fontSize
        label2.fontColor = Defaults.fontColor
        label2.verticalAlignmentMode = .center
        label2.width = self.frame.width
        label2.separator = " "
        label2.isExpired = isExpired
      
        addChild(label2)
        return label2
    }()
    
    /**
     The text displayed by the node.
     */
    open var text: String? {
        get { return label.text }
        set {
            label.text = newValue
            resize()
        }
    }
    open var text2: String? {
        get { return label2.text }
        set {
            label2.text = newValue
            resize()
        }
    }
    
    /**
     The image displayed by the node.
     */
    open var image: UIImage? {
        didSet {
//            let url = URL(string: "https://picsum.photos/1200/600")!
//            let image = UIImage(data: try! Data(contentsOf: url))
            texture = image.map { SKTexture(image: $0.aspectFill(self.frame.size)) }
        }
    }
    
    /**
     The color of the node.
     
     Also blends the color with the image.
     */
    open var color: UIColor = Defaults.color {
        didSet {
            self.fillColor = color
        }
    }
    open var isExpired: Bool = false
    open var texture: SKTexture?
    
    /**
     The selection state of the node.
     */
    open var isSelected: Bool = false {
        didSet {
            guard isSelected != oldValue else { return }
            if isSelected {
                selectedAnimation()
                accessibilityTraits = .selected
            } else {
                deselectedAnimation()
                accessibilityTraits = .none
            }
        }
    }

    /**
     The internal accessibilityPath used by the node.
     */
    private var overridenAccessibilityPath: UIBezierPath?

    open override var accessibilityPath: UIBezierPath? {
        get { overridenAccessibilityPath ?? UIBezierPath(ovalIn: self.accessibilityFrame) }
        set { self.overridenAccessibilityPath = newValue }
    }
    
    /**
     Controls whether the node should auto resize to fit its content
     */
    open var scaleToFitContent: Bool = Defaults.scaleToFitContent {
        didSet {
            resize()
        }
    }
    
    /**
     Additional padding to be applied on resize
     */
    open var padding: CGFloat = Defaults.padding {
        didSet {
            resize()
        }
    }
  
    /**
     The scale of the selected animation
    */
    open var selectedScale: CGFloat = 4 / 3
  
    /**
     The scale of the deselected animation
    */
    open var deselectedScale: CGFloat = 1

    /**
     The original color of the node before animation
    */
    private var originalColor: UIColor = Defaults.color
  
    /**
     The color of the seleted node
    */
    open var selectedColor: UIColor?
  
    /**
     The text color of the seleted node
    */
    open var selectedFontColor: UIColor?
  
    /**
     The original text color of the node before animation
     */
    private var originalFontColor: UIColor = Defaults.fontColor
    
    /**
     The duration of the selected/deselected animations
     */
    open var animationDuration: TimeInterval = 0
  
    /**
     The name of the label's font
    */
    open var fontName: String {
      get { label.fontName ?? Defaults.fontName }
      set {
        label.fontName = newValue
        resize()
      }
    }
    
    /**
     The size of the label's font
    */
    open var fontSize: CGFloat {
      get { label.fontSize }
      set {
        label.fontSize = newValue
        resize()
      }
    }
    
    /**
     The color of the label's font
    */
    open var fontColor: UIColor {
      get { label.fontColor ?? Defaults.fontColor }
      set { label.fontColor = newValue }
    }
    
    /**
     The margin scale of the node
     */
    open var marginScale: CGFloat = Defaults.marginScale {
      didSet {
        guard let path = path else { return }
        regeneratePhysicsBody(withPath: path)
      }
    }
    
    open private(set) var mainRadius: CGFloat?
    
    /**
     Set of default values
     */
    struct Defaults {
        static let fontName = "Avenir-Black"
        static let fontColor = UIColor.white
        static let fontSize = CGFloat(12)
        static let color = UIColor.clear
        static let marginScale = CGFloat(1.01)
        static let scaleToFitContent = false // backwards compatability
        static let padding = CGFloat(20)
    }
    
    /**
     Creates a node with a custom path.
     
     - Parameters:
        - text: The text of the node.
        - image: The image of the node.
        - color: The color of the node.
        - path: The path of the node.
        - marginScale: The margin scale of the node.
     
     - Returns: A new node.
     */
    public init(text: String? = nil,circleId: Int? = 0,count: String? = nil,isexpired: Bool? = false, image: UIImage? = nil, color: UIColor, path: CGPath, marginScale: CGFloat = 1.01) {
        super.init()
        self.path = path
        regeneratePhysicsBody(withPath: path)
        self.color = color
        self.isExpired = isexpired ?? false
        self.strokeColor = .clear
        _ = self.text
            self.position = CGPoint(x: 10, y: 0)
        configure(text: text,count: count , image: image, color: color)
        
        self.isAccessibilityElement = true
        self.shouldGroupAccessibilityChildren = true
    }
    
    /**
     Creates a node with a circular path.
     
     - Parameters:
        - text: The text of the node.
        - image: The image of the node.
        - color: The color of the node.
        - radius: The radius of the node.
        - marginScale: The margin scale of the node.
     
     - Returns: A new node.
     */
    public convenience init(text: String? = nil,circleId: Int? = 0,count: String? = nil,isexpired: Bool? = false, image: UIImage? = nil, color: UIColor, radius: CGFloat, marginScale: CGFloat = 1.01) {
        let path = SKShapeNode(circleOfRadius: radius).path!
//        self.SetSize(size: radius)
       
        self.init(text: text,circleId: circleId,count: count,isexpired: isexpired, image: image, color: color, path: path, marginScale: marginScale)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configure(text: String?,circleId: Int? = 0,count: String?,isexpired: Bool? = false, image: UIImage?, color: UIColor) {
        
        self.text = text
        self.text2 = count
        self.image = image
        self.color = color
        self.isExpired = isexpired ?? false
        self.accessibilityLabel = text
    }
    
    override open func removeFromParent() {
        removedAnimation() {
            super.removeFromParent()
        }
    }
    
   
    
    /**
     Resizes the node to fit its current content
     */
    public func resize() {
        guard scaleToFitContent,let text2 = text2, let _ = UIFont(name: fontName, size: fontSize) else { return }
//        let fontAttributes = [NSAttributedString.Key.font: font]
       // let size = (text as NSString).size(withAttributes: fontAttributes)
       // let radius = size.width / 2 + CGFloat(padding)
        
        if  text2.checkStingIsInt(){
            let count = Int(text2) ?? 0
            mainRadius = CGFloat(40 + count*3)
        }
        else{
            mainRadius = CGFloat(40)
        }
        update(radius: mainRadius ?? 0, withLabelWidth: mainRadius ?? 0)
    }
   
    
    /**
     Updates the radius of the node and sets the label width to a given width or the radius
     
      - Parameters:
        - radius: The new radius
        - withLabelWidth: A custom width for the text label
     */
    public func update(radius: CGFloat, withLabelWidth width: CGFloat? = nil) {
        guard let path = SKShapeNode(circleOfRadius: radius).path else { return }
        self.path = path
        self.label.width = width ?? mainRadius
        regeneratePhysicsBody(withPath: path)
    }
    
    /**
     Regenerates the physics body with a given path after the path has changed .i.e. after resize
     */
    public func regeneratePhysicsBody(withPath path: CGPath) {
        self.physicsBody = {
          var transform = CGAffineTransform.identity.scaledBy(x: marginScale, y: marginScale)
          let body = SKPhysicsBody(polygonFrom: path.copy(using: &transform)!)
          body.allowsRotation = false
            body.friction = 1
            body.linearDamping = 1
            body.angularDamping = 2
            body.restitution = 0
            body.usesPreciseCollisionDetection = true
          return body
        }()
    }
    
    /**
     The animation to execute when the node is selected.
     */
    open func SetSize(size: CGFloat) {
        self.originalFontColor = fontColor
        self.originalColor = fillColor
        
        let scaleAction = SKAction.scale(to: size, duration: 0)
        
        if let selectedFontColor = selectedFontColor {
            label.run(.colorTransition(from: originalFontColor, to: selectedFontColor))
            label2.run(.colorTransition(from: originalFontColor, to: selectedFontColor))
        }
        
        if let selectedColor = selectedColor {
          run(.group([
            scaleAction,
            .colorTransition(from: originalColor, to: selectedColor, duration: 0)
          ]))
        } else {
          run(scaleAction)
        }

        if let texture = texture {
          fillTexture = texture
        }
    }
    
    open func selectedAnimation() {
        return
//        self.originalFontColor = fontColor
//        self.originalColor = fillColor
//
//        let scaleAction = SKAction.scale(to: selectedScale, duration: animationDuration)
//
//        if let selectedFontColor = selectedFontColor {
//            label.run(.colorTransition(from: originalFontColor, to: selectedFontColor))
//            label2.run(.colorTransition(from: originalFontColor, to: selectedFontColor))
//        }
//
//        if let selectedColor = selectedColor {
//          run(.group([
//            scaleAction,
//            .colorTransition(from: originalColor, to: selectedColor, duration: animationDuration)
//          ]))
//        } else {
//          run(scaleAction)
//        }
//
//        if let texture = texture {
//          fillTexture = texture
//        }
        
    }
    
    /**
     The animation to execute when the node is deselected.
     */
    open func deselectedAnimation() {
        return
//        let scaleAction = SKAction.scale(to: deselectedScale, duration: animationDuration)
//        
//        if let selectedColor = selectedColor {
//          run(.group([
//            scaleAction,
//            .colorTransition(from: selectedColor, to: originalColor, duration: animationDuration)
//          ]))
//        } else {
//          run(scaleAction)
//        }
//        
//        if let selectedFontColor = selectedFontColor {
//          label.run(.colorTransition(from: selectedFontColor, to: originalFontColor, duration: animationDuration))
//            label2.run(.colorTransition(from: selectedFontColor, to: originalFontColor, duration: animationDuration))
//        }
//
//        self.fillTexture = nil
    }
    
    /**
     The animation to execute when the node is removed.
     
     - important: You must call the completion block.
     
     - parameter completion: The block to execute when the animation is complete. You must call this handler and should do so as soon as possible.
     */
    open func removedAnimation(completion: @escaping () -> Void) {
        run(.group([.fadeOut(withDuration: animationDuration), .scale(to: 0, duration: 0)]), completion: completion)
    }
    
}

extension String{
    // Function to check if the given number is numeric
    func checkStingIsInt() -> Bool {
       return Double(self) != nil
    }
    
}
