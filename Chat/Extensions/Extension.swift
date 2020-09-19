//
//  ViewExtension.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    func viewCornerRadius(_ value:CGFloat)
    {
        self.layer.cornerRadius = value
        self.clipsToBounds = true
    }
    
    func putBorder(borderColor color:UIColor,borderWidth width:CGFloat)
    {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func rotate(withValue value:Double)
    {
        UIView.animate(withDuration: 0.25) {
            self.transform = CGAffineTransform(rotationAngle: CGFloat(value))
        }
    }
    
    func addGradient(colors:(UIColor,UIColor, UIColor)) {
        if layer.sublayers?.first?.isKind(of: CAGradientLayer.self) ?? false {
            layer.sublayers?.first?.removeFromSuperlayer()
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = [colors.0.cgColor, colors.1.cgColor, colors.2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
}

extension Int
{
    private static var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSize = 3
        numberFormatter.secondaryGroupingSize = 2
        return numberFormatter
    }()
    var delimiter: String? {
        return Int.numberFormatter.string(from: NSNumber(value: self))
    }
}

extension UILabel
{
    func setViewAttributes(viewFont font:UIFont, textColor color:UIColor)
    {
        self.font = font
        self.textColor = color
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPhone() -> Bool{
        let phoneNumberRegex = "^[6-9]\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        let isValidPhone = phoneTest.evaluate(with: self)
        return isValidPhone
    }
}

extension UITextField
{
    func setAttributedPlaceholder(text:String, color:UIColor)
    {
        self.attributedPlaceholder = NSAttributedString(string: text,
                                                               attributes: [NSAttributedString.Key.foregroundColor: color])
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension UIImage{
    
    func convertImageToBase64String() -> String? {
        var actualHeight = Float(self.size.height)
        var actualWidth = Float(self.size.width)
        let maxHeight: Float = 400.0
        let maxWidth: Float = 400.0
        var imgRatio: Float = actualWidth / actualHeight
        let maxRatio: Float = maxWidth / maxHeight
        let compressionQuality: Float = 0.5
        //50 percent compression
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else {
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        let imageData = img?.jpegData(compressionQuality: CGFloat(compressionQuality))
        UIGraphicsEndImageContext()
        return imageData?.base64EncodedString(options: .init(rawValue: 0))
    }
    
}

extension UIButton
{
    func getUnderlinedText(text:String, underlineColor:UIColor)
    {
        let attributedText = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.underlineColor:underlineColor,NSAttributedString.Key.foregroundColor:underlineColor])
        self.setAttributedTitle(attributedText, for: .normal)
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
