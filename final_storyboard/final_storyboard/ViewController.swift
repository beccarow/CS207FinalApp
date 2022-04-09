//
//  ViewController.swift
//  final_storyboard
//
//  Created by Joie You on 4/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let imagePredictor = Predictor()
    
    let toShow = 1
}

// attached to segue to prediction image view controller
 extension ViewController {
    func update(_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
    func updatePredictionLabel(_ message: String) {
        DispatchQueue.main.async {
            self.updatePredictionLabel.text = message
        }
    }
}

extension ViewController {
    func classify(_ image: UIImage) {
        do {
            try self.imagePredictor.makePredictions(for: image, completionHandler: <#T##Predictor.ImagePredictionHandler##Predictor.ImagePredictionHandler##(_ predictions: [Predictor.Prediction]?) -> Void#>)
        } catch {
            print("Unable to make a prediction")
        }
    }
    
    
    func imagePredictionHandler(_ predictions: [Predictor.Prediction]?) {
        guard let predictions = predictions else {
            updatePredictionLabel("No predictions")
            return
        }
        
        let mostConfident = formatPredictions(predictions)
        
        updatePredictionLabel(mostConfident.joined(separator: ""))
    }
    
    func formatPredictions(_ predictions: [Predictor.Prediction]) -> [String] {
        let top: [String] = predictions.prefix(toShow).map { prediction in
            let name = prediction.classification
            
            if Int(prediction.confidencePercentage) ?? <#default value#>! > 10 && name == "plastic bag" {
                return "This is \(prediction.confidencePercentage)% likely to be a plastic bag"
            }
        }
        
        return top
    }
}

