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
        
        //Display original image
        if toggleButton.selected{
            image.image = UIImage(named: "sample")
            toggleButton.selected = false
            
        //Display filtered image
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
        
        //Add secondary view to main view
        view.addSubview(secondaryMenu)
        
        //Disable default auto layout
        secondaryMenu.translatesAutoresizingMaskIntoConstraints = false
        
        //Add constraints
        let bottomConstraint = secondaryMenu.bottomAnchor.constraintEqualToAnchor(bottomMenu.topAnchor)
        let leftConstraint = secondaryMenu.leftAnchor.constraintEqualToAnchor(view.leftAnchor)
        let rightConstraint = secondaryMenu.rightAnchor.constraintEqualToAnchor(view.rightAnchor)
        let heightConstraint = secondaryMenu.heightAnchor.constraintEqualToConstant(44)
        
        //Activate Constraints
        NSLayoutConstraint.activateConstraints([bottomConstraint, leftConstraint, rightConstraint, heightConstraint])
        view.layoutIfNeeded()
        
        //Animate secondary view by fading it in
        self.secondaryMenu.alpha = 0
        UIView.animateWithDuration(0.4) {
            self.secondaryMenu.alpha = 1.0
        }
        
        secondaryMenu.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
    }
    
    func hideSecondaryMenu(){
        
        //Animate secondary view by fading it out before removing from main view
        self.secondaryMenu.alpha = 1
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            self.secondaryMenu.alpha = 0
            
            //Runs when animation is completed
            }) { completed in
                if completed {
                    self.secondaryMenu.removeFromSuperview()
                }
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

