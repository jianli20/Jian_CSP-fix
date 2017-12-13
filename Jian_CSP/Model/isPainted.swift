//
//  isPainted.swift
//  Jian_CSP
//
//  Created by Li, Jian Hong on 11/20/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
public class woodHouse : Paintable
{
    private var houseColor :UIColor
    public var paintState: Bool
    
    public init()
    {
        self.houseColor = UIColor()
        self.paintState = false
    }
    
    public func paint() -> Void
    {
        paintState = true
    }
    public func isPainted() -> Bool
    {
        if(paintState)
    {
    print("painted")
    }
    else
    {
    print("no paint")
    }
    return paintState
    }
}
