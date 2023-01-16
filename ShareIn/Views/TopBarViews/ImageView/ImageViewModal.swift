//
//  ImageViewModal.swift
//  ShareIn
//
//  Created by IAAA Technologies on 07/11/22.
//

import Foundation
import Photos
import UIKit


class ImageViewModal : ObservableObject{
    
  

        @Published var allPhotos = [UIImage]()
        @Published var errorString : String = ""
        @Published var imageNames = [String]()

        init() {
            requestAuthorization()
        }
    func requestAuthorization(){
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
                DispatchQueue.main.async {
                    self.errorString = ""
                    self.getAllPhotos()
                }
                
            case .denied, .restricted:
                self.errorString = "Photo access permission denied"
            case .notDetermined:
                self.errorString = "Photo access permission not determined"
            case .limited:
                print("Limiting images")
            @unknown default:
                fatalError()
            }
        }
    }
        fileprivate func getAllPhotos() {

            let manager = PHImageManager.default()
            let requestOptions = PHImageRequestOptions()
            requestOptions.isSynchronous = false
            requestOptions.deliveryMode = .highQualityFormat
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]

            let results: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
            if results.count > 0 {
                for i in 0..<results.count {
                    let asset = results.object(at: i)
                    let assetResource = PHAssetResource.assetResources(for: asset)
                     let fileName = assetResource.first?.originalFilename ?? "Attachment"
                 
                    let size = CGSize(width: 200, height: 200) //You can change size here
                    manager.requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: requestOptions) { (image, _) in
                        if let image = image {
                           
                          //  print(fileName)
                            self.allPhotos.append(image)
                            self.imageNames.append(fileName)
                          //  print(self.allPhotos.count)
                        } else {
                            print("error asset to image")
                        }
                    }
                }
            } else {
                self.errorString = "No photos to display"
            }
        }
  
    

}
