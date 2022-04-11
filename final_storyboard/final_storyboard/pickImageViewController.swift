//
//  pickImageViewController.swift
//  final_storyboard
//
//  Created by Soumya Bodavula on 4/11/22.
//
//  Code for picking image from user gallery

import UIKit

/*class pickImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

} */

class pickImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet var imageView: UIImageView! //connect to UIImageView on storyboard
    @IBOutlet var chooseButton: UIButton! //connect to UIButton on storyboard
    var imagePicker = UIImagePickerController()

    @IBAction func btnClicked() {

        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
        }
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in

        })

        imageView.image = image
    }
}
