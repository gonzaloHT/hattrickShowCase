//
//  Style.swift
//  HTShowcase
//
//  Created by Gonzalo Barrios on 5/22/18.
//  Copyright © 2018 Gonzalo Barrios. All rights reserved.
//

import Foundation
import UIKit

struct Style {
    
    struct Fonts {
        
        struct Raleway {
            
            static func regularFontOfSize(ofSize size: CGFloat) -> UIFont {
                return UIFont(name: "Raleway-Regular", size: size)!
            }
            
            static func blackFontOfSize(ofSize size: CGFloat) -> UIFont {
                return UIFont(name: "Raleway-Black", size: size)!
            }
            
            static func blackItalicFontOfSize(ofSize size: CGFloat) -> UIFont {
                return UIFont(name: "Raleway-BlackItalic", size: size)!
            }
            
            static func boldFontOfSize(ofSize size: CGFloat) -> UIFont {
                return UIFont(name: "Raleway-Bold", size: size)!
            }
            
            static func mediumFontOfSize(ofSize size: CGFloat) -> UIFont {
                return UIFont(name: "Raleway-Medium", size: size)!
            }
            
            static func semiBoldFontOfSize(ofSize size: CGFloat) -> UIFont {
                return UIFont(name: "Raleway-SemiBold", size: size)!
            }
            
            static func lightFontOfSize(ofSize size: CGFloat) -> UIFont {
                return UIFont(name: "Raleway-Light", size: size)!
            }
            
            static func thinFontOfSize(ofSize size: CGFloat) -> UIFont {
                return UIFont(name: "Raleway-Thin", size: size)!
            }
            
        }
        
    }
    
    struct Colors {
        
        static func mainBlueColor() -> UIColor {
            return UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.00)
        }
        
    }
    
}
