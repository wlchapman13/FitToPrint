//
//  AsyncImageView.swift
//  FitToPrint
//
//  Created by William Chapman on 8/24/19.
//  Copyright © 2019 William Chapman. All rights reserved.
//

import SwiftUI
import Combine

//struct AsyncImageView: View {
//    
//    @ObservedObject var imageFetcher: ImageFetcher
//    
//    var stateContent: AnyView {
//        if let image = UIImage(data: imageFetcher.data) {
//            return AnyView(
//                Image(uiImage: image).resizable()
//            )
//        } else {
//            return AnyView(
//                ActivityIndicator(style: .medium)
//            )
//        }
//    }
//    
//    init(with urlString: String) {
//        imageFetcher = ImageFetcher(url: urlString)
//    }
//    
//    var body: some View {
//        HStack {
//            stateContent
//        }
//    }
//}
//#if DEBUG
//struct AsyncImageView_Previews : PreviewProvider {
//    static var previews: some View {
//        AsyncImageView(with: "https://is2-ssl.mzstatic.com/image/thumb/Music113/v4/3d/6d/d0/3d6dd00b-b480-740f-bc6e-e2ca78ff918e/190296882920.jpg/200x200bb.png")
//    }
//}
//#endif
