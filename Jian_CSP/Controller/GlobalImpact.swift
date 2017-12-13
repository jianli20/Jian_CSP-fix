//
//  GlobalImpact.swift
//  Jian_CSP
//
//  Created by Li, Jian Hong on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

class GlobalImpact: UIViewController
{
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    private func setupImpact() -> Void
    {
        firstLabel.text = "The problem of climate change effects everyone in the world. The consenquences have already started to show in the world recently by the large amount of storms. In addition to problems like this, the consenquences of ignoring climate change will continue to stack and society needs to address this problem."
        
        secondLabel.text = "The global impact has effected my personally by changing the environment around me. Temperatures have noticably gone up and droughts are already occuring."
        
        firstImage.image = #imageLiteral(resourceName: "Impact App")
    }
    
   override public func viewDidLoad()
    {
        super.viewDidLoad()
        setupImpact()
    }
}
