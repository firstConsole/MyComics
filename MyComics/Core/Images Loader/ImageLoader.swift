//
//  ImageLoader.swift
//  MyComics
//
//  Created by Антон Сивцов on 02.07.2023.
//

import Foundation
import UIKit

final class ImageLoader {
    
    // MARK: - ImageVariant
    
    enum ImageVariant: String {
        case portrait_small    // 50x75px
        case portrait_medium    // 100x150px
        case portrait_xlarge    // 150x225px
        case portrait_fantastic    // 168x252px
        case portrait_uncanny    // 300x450px
        case portrait_incredible    // 216x324px
    }
    
    // MARK: - Static Properites
    
    static let shared = ImageLoader()
    
    // MARK: - Private Properties
    
    private var session = URLSession.shared
    
    // MARK: - Init
    
    private init() {}
    
    // MARK: - Public Method
    
    func loadImage(
        urlString: String?,
        urlExtension: String?,
        variant: ImageVariant = .portrait_incredible,
        completion: @escaping (UIImage?) -> Void
    ) {
        guard let urlString,
              let urlExtension,
              let url = URL(string: "\(urlString)/\(variant.rawValue).\(urlExtension)") else {
            completion(nil)
            return
        }
        
        let dataTask = session.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            let image = UIImage(data: data)
            completion(image)
        }
        
        dataTask.resume()
    }
}
