//
//  ExhibitImageViewController.swift
//  MuseumApp
//
//  Created by James Payne on 12/5/15.
//  Copyright © 2015 James Payne. All rights reserved.
//

import UIKit

class ExhibitImageViewController: ExhibitViewControllerBase {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!

    var headerText: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false
        headerText = ""

        print("ATTEMPTING TO LOAD:  id=\(exhibit!.resource!.resourceID), url=\(exhibit!.resource!.url), localPath=\(exhibit!.resource!.localPath)")

        // Do any additional setup after loading the view.
        if (exhibit!.resource!.localPath != "") {
            //        print(exhibit!.resource!.localPath)
            //        print("File exists? : \(NSFileManager.defaultManager().fileExistsAtPath(exhibit!.resource!.localPath))")
            let mainImage = UIImage(contentsOfFile: exhibit!.resource!.localPath)
            mainImageView.image = mainImage
            headerText = ""
        } else {
            headerText = "Image assest not yet downloaded:  Please try again later.\n\n"
        }


        // Set font size
        self.descriptionTextView.selectable = true
        self.descriptionTextView.font = UIFont(name: "Helvetica Neue", size: 24)
        self.descriptionTextView.selectable = false

        descriptionTextView.text = headerText! + exhibit!.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
