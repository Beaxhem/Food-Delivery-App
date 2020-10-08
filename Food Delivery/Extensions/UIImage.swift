//
//  UIImage.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 08.10.2020.
//
import SwiftUI

extension UIImage {
    class func roundedRectImageFromImage(image:UIImage,imageSize:CGSize,cornerRadius:CGFloat)->UIImage{
            UIGraphicsBeginImageContextWithOptions(imageSize, false, 0.0)
            let bounds = CGRect(origin: .zero, size: imageSize)
            UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).addClip()
            image.draw(in: bounds)
            let finalImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return finalImage!
        }
    
    func circularImage(_ radius: CGFloat) -> UIImage? {
        var imageView = UIImageView()
        if self.size.width > self.size.height {
            imageView.frame =  CGRect(x: 0, y: 0, width: self.size.width, height: self.size.width)
            imageView.image = self
            imageView.contentMode = .scaleAspectFit
        } else { imageView = UIImageView(image: self) }
        var layer: CALayer = CALayer()
    
        layer = imageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = radius
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        return roundedImage
    }
    
    func roundImage() -> UIImage
        {
            let newImage = self.copy() as! UIImage
            let cornerRadius = self.size.height/2
            UIGraphicsBeginImageContextWithOptions(self.size, false, 1.0)
            let bounds = CGRect(origin: .zero, size: self.size)
            UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).addClip()
        newImage.draw(in: bounds)
            let finalImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return finalImage!
        }
}
