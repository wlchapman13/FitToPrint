//
//  ImageFetcher.swift
//  FitToPrint
//
//  Created by William Chapman on 8/24/19.
//  Copyright © 2019 William Chapman. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

//class ImageFetcher: ObservableObject {
////    var didChange = PassthroughSubject<Data, Never>()
////
////    var data: Data = Data() {
////        didSet {
////            didChange.send(data)
////        }
////    }
//
////    var didChange = PassthroughSubject<Data, Never>()
//
//    var data: Data = Data()
//
//    init(url: String) {
//        guard let imageUrl = URL(string: url) else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: imageUrl) { (data, _, _) in
//            guard let data = data else { return }
//            DispatchQueue.main.async { [weak self] in
//                self?.data = data
//            }
//
//        }.resume()
//    }
//}





//////////////////////////////////////////////

//  ALTERNATE CODE

///////////////////////////////////////////////


//public protocol Fetcher {
//  func dataTaskPublisher(for url: URL) -> AnyPublisher<Data, URLError>
//}
//
//extension URLSession: Fetcher {
//  public func dataTaskPublisher(for url: URL) -> AnyPublisher<Data, URLError> {
//    self.dataTaskPublisher(for: url).map(\.data).eraseToAnyPublisher()
//  }
//}
//
//public class ImageFetcher: ObservableObject {
//
//  private let url: URL
//  private let session: Fetcher
//  private let cache: NSCache<NSString, UIImage>
//  private var networkCancellable: AnyCancellable?
//
//  public var objectWillChange = PassthroughSubject<Void, Never>()
//
//  public private(set) var image: UIImage? = nil {
//    willSet {
//      objectWillChange.send()
//    }
//  }
//
//  public init(url: URL,
//              session: Fetcher = URLSession.shared,
//              cache: NSCache<NSString, UIImage> = NSCache()
//  ) {
//    self.url = url
//    self.session = session
//    self.cache = cache
//  }
//
//  public func refresh() {
//    let key = NSString(string: url.absoluteString)
//
//    if let cachedImage = cache.object(forKey:key) {
//      image = cachedImage
//    }
//    else {
//      networkCancellable = session.dataTaskPublisher(for: url)
//        .map(UIImage.init(data:))
//        .catch { _ in Empty<UIImage?, Never>() }
//        .receive(on: DispatchQueue.main)
//        .handleEvents(receiveOutput: { image in
//          guard let newImage = image else { return }
//          self.cache.setObject(newImage, forKey: key)
//        })
//        .assign(to: \.image, on: self)
//    }
//  }
//
//  public func cancel() {
//    networkCancellable?.cancel()
//  }
//}
