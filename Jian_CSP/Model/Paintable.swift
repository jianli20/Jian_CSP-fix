//
//  Paintable.swift
//  Jian_CSP
//
//  Created by Li, Jian Hong on 11/20/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import Foundation
public protocol Paintable
{
    var  paintState : Bool {get set}
    func paint() -> Void
    func isPainted() -> Bool
}
