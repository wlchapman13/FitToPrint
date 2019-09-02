//
//  ContentView.swift
//  FitToPrint
//
//  Created by William Chapman on 8/23/19.
//  Copyright © 2019 William Chapman. All rights reserved.
//

import SwiftUI
import RemoteImage

struct ContentView: View {
    
    @ObservedObject var model = ArticleListViewModel()
    
    var body: some View {
        List(model.articles) { article in
            VStack(alignment: .leading, spacing: 10.0) {
                Text(article.title)
                    .foregroundColor(.primary)
                    .font(.headline)
            
                RemoteImage(url: article.url, errorView: { error in
                    Text(error.localizedDescription)
                        }, imageView: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        }, loadingView: {
                            Text("Loading ...")
                })
                
                Text(article.description)
                    .foregroundColor(.secondary)
            }.padding(10.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
