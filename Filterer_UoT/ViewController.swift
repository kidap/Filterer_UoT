//
//  ViewController.swift
//  Filterer_UoT
//
//  Created by Karlo Pagtakhan on 01/13/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var originalImage = UIImage()
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var toggleButton: UIButton!
    @IBOutlet var bottomMenu: UIView! //Bottom menu on main view
    @IBOutlet var secondaryMenu: UIView! //Showed when Filter button is clicked
    @IBOutlet var filterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        image.image = UIImage(named: "sample")
        originalImage = UIImage(named: "sample")!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Buttons
    @IBAction func onShare(sender: AnyObject) {
        if let sharedImage = self.image.image{
        let activityController = UIActivityViewController(activityItems: [sharedImage], applicationActivities: nil)
            
            self.presentViewController(activityController, animated: true, completion: nil)
        }
    }

    
    @IBAction func onNewPhoto(sender: AnyObject) {
        //Create action sheet to select the source of the image
        let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: .ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { action in
            self.showCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Album", style: .Default, handler: { action in
            self.showAlbum()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil ))
        
        //Display the action sheet
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    @IBAction func toggleImage(sender: UIButton) {
        
        //Display original image
        if toggleButton.selected{
            image.image = self.originalImage
            toggleButton.selected = false
            
            //Display filtered image
        } else {
            let tmpImage = image.image
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
    
    
    // MARK: Functions
    func showCamera(){
        print("Showing the camera")
        let cameraPicker = UIImagePickerController()
        
        cameraPicker.delegate = self
        cameraPicker.sourceType = .Camera
        
        self.presentViewController(cameraPicker, animated: true, completion: nil)
    }
    
    func showAlbum(){
        print("Showing the album")
        let albumPicker = UIImagePickerController()
        
        albumPicker.delegate = self
        albumPicker.sourceType = .PhotoLibrary
        
        self.presentViewController(albumPicker, animated: true, completion: nil)
    }

    
    // MARK: Image Picker delegates
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        dismissViewControllerAnimated(true, completion: nil)
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            self.image.image = image
            self.originalImage = image
        }
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // MARK: Secondary Menu
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
    
}

