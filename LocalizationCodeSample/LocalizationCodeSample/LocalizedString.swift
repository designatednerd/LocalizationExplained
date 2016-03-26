//
//  LocalizedStrings.swift
//  LocalizationCodeSample
//
//  Created by Ellen Shapiro (Vokal) on 8/17/15.
//  Copyright © 2015 Designated Nerd Software. All rights reserved.
//

import Foundation

//Use an enum so this can't be instantiated on its own
enum LocalizedString {
    
    //MARK: - Ordinal VC
    static let ordinalVCTitle = NSLocalizedString("ordinalvc.title",
        comment: "Title for a list of ordinal numbers")
    
    //MARK: - Controls VC
    static let sliderValueFormat = NSLocalizedString("controlsvc.slidervalueformat",
        comment: "Format for the value of the UISlider")
}
