//
//  NewsView.swift
//  News
//
//  Created by Антон Яценко on 12.01.2023.
//

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var data: SpaceAPI
    @Environment(\.openURL) var openUrl
    private var textWidth = 300.0
    
    var body: some View {
        List{
            ForEach(data.news){ news in
                NewsArticle(title: news.title, siteName: news.newsSite, imageUrl: news.imageUrl, summary: news.summary)
                    .onTapGesture {
                        openUrl(URL(string: news.url)!)
                    }
            }
        }
        .refreshable {
            data.getData()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(SpaceAPI())
    }
}
