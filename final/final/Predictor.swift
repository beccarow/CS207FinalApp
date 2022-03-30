//
//  Predictor.swift
//  final
//
//  Created by Rebecca Row on 3/29/22.
//

import Foundation
import Vision
import UIKit
import CoreML


class Predictor {
    static func createImageClassifier() -> VNCoreMLModel {
        let defaultConfig = MLModelConfiguration()
        
        let classifierWrapper = try? MobileNetV2(configuration: defaultConfig)
        
        guard let imageClassifier = classifierWrapper else {
            fatalError("Failed to create an image classifier model")
        }
        
        let classifierModel = imageClassifier.model
        
        guard let visionModel = try? VNCoreMLModel(for: classifierModel) else {
            fatalError("Failed to create a `VNCoreMLModel`")
        }
        
        return visionModel
    }
}
