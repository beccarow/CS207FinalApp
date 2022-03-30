//
//  extractImage.swift
//  final
//
//  Created by Rebecca Row on 3/28/22.
//

import AVFoundation
import UIKit

protocol extractDelegate: AnyObject {
    func capturePhoto(with settings: AVCapturePhotoSettings, delegate: AVCapturePhotoCaptureDelegate)
}

class extract: NSObject, AVCapturePhotoCaptureDelegate {
    
    var pos = AVCaptureDevice.Position.back
    let captureSession = AVCaptureSession()
    let sessionQueue = DispatchQueue(label: "queue")
    let settings: AVCapturePhotoSettings
    
    
    
    func configSession() {
        captureSession.beginConfiguration()
        let photoOutput = AVCapturePhotoOutput()
        photoOutput.isHighResolutionCaptureEnabled = true
        guard self.captureSession.canAddOutput(photoOutput) else { return }
        self.captureSession.sessionPreset = .photo
        self.captureSession.addOutput(photoOutput)

        self.previewView.session = captureSession

        self.captureSession.commitConfiguration()
        self.captureSession.startRunning()
    }
    
    func requestPermission() {
        sessionQueue.suspend()
        
    }
}


