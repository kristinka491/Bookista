//
//  LocalManager.swift
//  Bookista
//
//  Created by Krystsina on 2023-05-19.
//

import Foundation
import SwiftUI

class LocalManager {

    private var directory: NSURL? {
        return try? FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: false) as NSURL
    }

    func saveImage(image: UIImage?, imageName: String) {
        guard let directory = directory,
              let data = image?.jpegData(compressionQuality: 1) else { return }
        do {
            if let uploadPath = directory.appendingPathComponent("\(imageName).jpeg") {
                try data.write(to: uploadPath)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func getSavedImage(imageName: String?) -> UIImage? {
        guard let imageName = imageName,
              let url = directory?.appendingPathComponent("\(imageName).jpeg") else {
            return nil
        }

        do {
            let imageData = try Data(contentsOf: url)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }

    func deleteImage(imageName: String?) {
        guard let imageName = imageName,
              let uploadPath = directory?.appendingPathComponent("\(imageName).jpeg") else {
            return
        }

        do {
            try FileManager.default.removeItem(atPath: uploadPath.path)
        } catch  {
            print("Could not delete file, probably read-only filesystem")
        }
    }
}
