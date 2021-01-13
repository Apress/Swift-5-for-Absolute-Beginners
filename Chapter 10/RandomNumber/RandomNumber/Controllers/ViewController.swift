//
//  ViewController.swift
//  RandomNumber
//
//  Created by Stefan Kaczmarek on 3/5/19.
//  Copyright © 2019 The Zonie, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var randomNumberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func seedAction(_ sender: Any) {
        srandom(UInt32(time(nil)))
        randomNumberLabel.text = "Generator Seeded"
    }

    @IBAction func generateAction(_ sender: Any) {
        let generated = Int.random(in: 1...100)
        randomNumberLabel.text = "\(generated)"
    }
}

