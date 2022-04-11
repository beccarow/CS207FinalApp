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
    var myImagePicker = UIImagePickerController() //could be a let I think

    @IBAction func btnClicked() {

        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            myImagePicker.delegate = self
            myImagePicker.sourceType = .photoLibrary //another source type: .camera
            myImagePicker.allowsEditing = false //true: allows resizing/cropping after selection
            //myImagePicker.mediaTypes = ["public.image"] -- only pictures, not movies/videos

            present(myImagePicker, animated: true, completion: nil)
        }
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in

        })

        imageView.image = image
    }
}
