//
//  TestSwiftClass.swift
//  RCTAppleHealthKit
//
//  Created by Anastasia Mishur on 27.02.23.
//  Copyright © 2023 Greg Wilson. All rights reserved.
//

import Foundation

//@objc (TestSwiftClass)
@objcMembers public class TestSwiftClass: NSObject {
    func returnValue() -> String {
        return "value from Swift class"
    }
}
