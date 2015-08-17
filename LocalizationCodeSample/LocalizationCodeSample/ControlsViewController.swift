//
//  ControlsViewController.swift
//  LocalizationCodeSample
//
//  Created by Ellen Shapiro (Vokal) on 8/17/15.
//  Copyright © 2015 Designated Nerd Software. All rights reserved.
//

import UIKit

class ControlsViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var switchControl: UISwitch!
    @IBOutlet var sliderControl: UISlider!
    @IBOutlet var sliderValueLabel: UILabel!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateSliderValueLabel()
    }
    
    
    //MARK: - Helper functions
    
    private func updateSliderValueLabel() {
        let localizedFormat = NSLocalizedString("controlsvc.slidervalueformat", comment: "Format for the value of the UISlider")
        let localizedValue = NSString.localizedStringWithFormat(localizedFormat, sliderControl.value) as String
        
        sliderValueLabel.text = localizedValue
    }
    
    //MARK: - IBActions 
    
    @IBAction func sliderValueChanged() {
        updateSliderValueLabel()
    }
}
