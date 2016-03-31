//
//  BeverageCell.swift
//  myWater
//
//  Created by Marc Felden on 12.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import UIKit

class ActorCell: UICollectionViewCell {
    
    var textLabel: UILabel!
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        let imageSize = CGSize(width: 60, height: 60)
        let textLabelSize = CGSize(width: 80, height: 20)
        
        imageView = UIImageView(frame: CGRect(x: 15, y: 10, width: imageSize.width, height: imageSize.height))
        
        textLabel = UILabel(frame: CGRect(x: 5, y: 70, width: textLabelSize.width, height: textLabelSize.height))
        textLabel.font = UIFont(name: "Helvetica", size: 13)
        textLabel.backgroundColor = UIColor.myWaterLightBlue()
        textLabel.textAlignment = .Center
        textLabel.textColor = UIColor.myWaterTextColorDarkBlue()

        layoutSubviews()
    }
    
    override func layoutSubviews() {

        self.addSubview(textLabel)
        self.addSubview(imageView)
    }
    
    func configureCellWithItem(actor: Actor) {
    
        textLabel.text = actor.name
        let image = UIImage(named: actor.state ?? "off")
        imageView.image = image
    }
    
    
    
    let animationRotateDegres: CGFloat = 0.5
    let animationTranslateX: CGFloat = 1.0
    let animationTranslateY: CGFloat = 1.0
    let count: Int = 1
    
    func wobble() {
        let leftOrRight: CGFloat = (count % 2 == 0 ? 1 : -1)
        let rightOrLeft: CGFloat = (count % 2 == 0 ? -1 : 1)
        let leftWobble: CGAffineTransform = CGAffineTransformMakeRotation(degreesToRadians(animationRotateDegres * leftOrRight))
        let rightWobble: CGAffineTransform = CGAffineTransformMakeRotation(degreesToRadians(animationRotateDegres * rightOrLeft))
        let moveTransform: CGAffineTransform = CGAffineTransformTranslate(leftWobble, -animationTranslateX, -animationTranslateY)
        let conCatTransform: CGAffineTransform = CGAffineTransformConcat(leftWobble, moveTransform)
        
        transform = rightWobble // starting point
        
        UIView.animateWithDuration(0.1, delay: 0.08, options: [.AllowUserInteraction, .Repeat, .Autoreverse], animations: { () -> Void in
            self.transform = conCatTransform
            }, completion: nil)
    }
    
    func stopWobble() {
        self.layer.removeAllAnimations()
    }
    
    func degreesToRadians(x: CGFloat) -> CGFloat {
        return CGFloat(M_PI) * x / 180.0
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    

}

