//
//  NewsArticle.swift
//  News
//
//  Created by Антон Яценко on 12.01.2023.
//

import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    
    let title: String
    let siteName: String
    let imageUrl: String
    let summary: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            
            HStack(alignment: .center){
                CachedAsyncImage (url: URL(string: imageUrl), transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image{
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity)
                    } else{
                        ProgressView()
                    }
                }
            }
            
            Text(title)
                .font(.headline)
                .padding(8)
            
            Text(summary)
                .lineLimit(6)
                .font(.body)
                .padding()
        }
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "Hello", siteName: "site name", imageUrl: "djdjdjjd", summary: "snsnsn")
    }
}
