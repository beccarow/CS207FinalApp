//
//  predictorViewController.swift
//  final_storyboard
//
//  Created by Rebecca Row on 4/13/22.
//

import Foundation
import UIKit


class predictorViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var yesOrNoImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image=yesOrNoImage
        print(yesOrNoImage)
        // Do any additional setup after loading the view.
    }
    
}
