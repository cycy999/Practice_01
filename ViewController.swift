//
//  ViewController.swift
//  Practice_01
//
//  Created by 陈岩 on 2019/2/28.
//  Copyright © 2019 陈岩. All rights reserved.
//

import UIKit

#if PRACTIVEDEV
let testString = "this is a dev target"
#elseif PRACTIVETEST
let testString = "this is a test target"
#else
let testString = "this is a normal target"
#endif

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(testString)
    }

}

