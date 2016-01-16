//
//  ViewController.swift
//  Filterer_UoT
//
//  Created by Karlo Pagtakhan on 01/13/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var toggleButton: UIButton!

    
    @IBAction func toggleImage(sender: UIButton) {
        
        if toggleButton.selected{
            image.image = UIImage(named: "sample")
            toggleButton.selected = false
        } else {
            
            let tmpImage = UIImage(named: "sample")
            let imageProcDefaultFilter = ImageProcessor(image: tmpImage!)
            
            image.image = imageProcDefaultFilter.applyFilter(filterType: .contrast)
            toggleButton.selected = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        image.image = UIImage(named: "sample")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

