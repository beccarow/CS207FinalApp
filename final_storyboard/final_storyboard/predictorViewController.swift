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
    
    @IBOutlet weak var predictionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    let imagePredictor = Predictor()
    
    let toShow = 1
}

// still needed: functions to detect and "save"/display current scene/image
 extension predictorViewController {
    func update(_ image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
    func updatePredictionLabel(_ message: String) {
        DispatchQueue.main.async {
            self.predictionLabel.text = message
        }
    }
}

extension predictorViewController {
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
