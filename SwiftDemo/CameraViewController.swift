//
//  CameraViewController.swift
//  SwiftDemo
//
//  Created by Ju Liaoyuan on 2017/8/24.
//  Copyright © 2017年 Fangzhiwei Information Technology Co., Ltd. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate {

    var captureSession: AVCaptureSession? // 采集管理
    var stillImageOutput: AVCaptureStillImageOutput? // 输出源
    var previewLayer: AVCaptureVideoPreviewLayer? // 预览层
    var cameraView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        previewLayer?.frame = cameraView.bounds
        captureSession = AVCaptureSession()
        cameraConfigure()
        // Do any additional setup after loading the view.
    }
    
    func cameraConfigure() {
        
        // 预设分辨率
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        // 获取后置摄像头
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        var error: NSError?
        
        var deviceInput: AVCaptureDeviceInput?
        
        do {
            deviceInput = try AVCaptureDeviceInput(device: device)
        } catch let cameraError as NSError {
            error = cameraError
        }
        
        if error == nil && (captureSession?.canAddInput(deviceInput))! {
            captureSession?.addInput(deviceInput) // 把摄像头加入到 captureSession 中
        } else {
            print(error ?? "error");
        }
        
        stillImageOutput = AVCaptureStillImageOutput.init() // 输出源
        var AVCaptureStillImageIsCapturingStillImageContext = "AVCaptureStillImageIsCapturingStillImageContext"
        stillImageOutput?.addObserver(self, forKeyPath: "capture", options: .new, context: &AVCaptureStillImageIsCapturingStillImageContext)
//        stillImageOutput?.addObserver(self, forKeyPath: "captureingStillImage", options:.new, context: AVCaptureStillImageIsCapturingStillImageContext);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
