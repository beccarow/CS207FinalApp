//
//  ViewController.swift
//  final_storyboard
//
//  Created by Joie You on 4/4/22.
//

import Foundation
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var userImage:UIImage? = nil
    
    //@IBOutlet var imageView: UIImageView! //connect to UIImageView on storyboard
    //@IBOutlet var chooseButton: UIButton! //connect to UIButton on storyboard
    var myImagePicker = UIImagePickerController() //could be a let

    @IBAction func btnClicked() { //connect to UIButton on storyboard

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            print("Button capture")

            myImagePicker.delegate = self
            myImagePicker.sourceType = .photoLibrary //another source type: .camera
            myImagePicker.allowsEditing = false //true: allows resizing/cropping after selection
            myImagePicker.mediaTypes = ["public.image"] //only pictures, not movies/videos

            present(myImagePicker, animated: true, completion: nil)
        }
    }

    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in

        })

        userImage = image
    }

    
    
    @IBAction func processPhoto(_ sender: Any) {
        //When user clicks this, we want to call ML model
        //To classify the image with ML
        guard let image = userImage else {
            return
        }
        classify(image)
        
        //Once model gives us result, then segue to prediction screen
        
        //When seque to prediction screen is done, we pass in the yes or no photo
    }
    
    //This is method for when the take photo button is pressed
    @IBAction func takePhotoButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let imagePredictor = Predictor()
    
    let toShow = 1
    
    //Functions are responsible for picking the image through the camera
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        //IMAGE BEING SELECTED IS STORED HERE AS image
        userImage = image
    }
    
    func makeSeque(_ img: UIImage){
        let vc = storyboard?.instantiateViewController(identifier: "predictorViewController") as? predictorViewController
        
        vc?.yesOrNoImage = img
        print("makeSeque")
        print(img)
        
//        self.navigationController?.pushViewController(vc!, animated: true)
        self.present(vc!, animated: true)
    }
}

//Take the image and pass it to ML model
extension ViewController {
    
    
    func classify(_ image: UIImage) {
        do {
            try self.imagePredictor.makePredictions(for: image, completionHandler: imagePredictionHandler(_:))
        } catch {
            print("Unable to make a prediction")
        }
    }
    
    
    func imagePredictionHandler(_ predictions: [Predictor.Prediction]?) {
        guard let predictions = predictions else {
            makeSeque(UIImage(named: "no_icon")!)
            return
        }
        
        let mostConfident = formatPredictions(predictions)
        
        if(mostConfident){
            makeSeque(UIImage(named: "yes_icon")!)
        }
        else{
            makeSeque(UIImage(named: "no_icon")!)
        }
    }
    
    func formatPredictions(_ predictions: [Predictor.Prediction]) -> Bool {
        print(predictions)
        
        for prediction in predictions {
            let name = prediction.classification
            print(Double(prediction.confidencePercentage))
            if Double(prediction.confidencePercentage) ?? 0 > 10 && name == "plastic bag" {
                print(Double(prediction.confidencePercentage))
                return true
            }
        }
        return false
    }
}

//ML model will classify it
//The result of the classification will determine the yes or no picture on predictorViewController

//// attached to segue to prediction image view controller
// extension ViewController {
//    func update(_ image: UIImage) {
//        DispatchQueue.main.async {
//            self.imageView.image = image
//        }
//    }
//
//    func updatePredictionLabel(_ message: String) {
//        DispatchQueue.main.async {
//            self.updatePredictionLabel.text = message
//        }
//    }
//}

