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

    @IBAction func imageTouchDown(sender: AnyObject) {
        image.image = UIImage(named: "sample")
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let tmpImage = UIImage(named: "sample")
        
        let imageProcDefaultFilter = ImageProcessor(image: tmpImage!)
        
        image.image = imageProcDefaultFilter.applyFilter(filterType: .contrast)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let tmpImage = UIImage(named: "sample")
        
        let imageProc = ImageProcessor(image: tmpImage!)
        imageProc.applyFilter(filterType: filter.brightness, intensity: 100)
        
        let imageProcMultipleFilters = ImageProcessor(image: tmpImage!)
        imageProcMultipleFilters.applyFilters(filterTypes: (type: .grayscale, intensity: 80),(type: .contrast, intensity: 80))
        
        
        let imageProcDefaultFilter2 = ImageProcessor(image: tmpImage!)
        imageProcDefaultFilter2.applyFilter(filterType: filter.contrast)
        
        
        let imageProcDefaultFilter = ImageProcessor(image: tmpImage!)
        
        image.image = imageProcDefaultFilter.applyFilter(filterType: .contrast)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

