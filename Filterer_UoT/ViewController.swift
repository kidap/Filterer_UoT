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

    
    @IBOutlet var bottomMenu: UIView!
    @IBOutlet var secondaryMenu: UIView!
    @IBOutlet var filterButton: UIButton!
    
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
    @IBAction func onFilter(sender: UIButton) {
        if sender.selected{
            hideSecondaryMenu()
            sender.selected = false
        } else {
            showSecondaryMenu()
            sender.selected = true
        }
        
    }
    
    func showSecondaryMenu(){
        
        view.addSubview(secondaryMenu)
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        
        
        view.layoutIfNeeded()
        
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    }
    
    func hideSecondaryMenu(){
        secondaryMenu.removeFromSuperview()
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

