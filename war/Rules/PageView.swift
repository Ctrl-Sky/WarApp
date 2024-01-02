//
//  PageView.swift
//  war
//
//  Created by Sky Quan on 2023-11-23.
//

import SwiftUI

struct RuleView: View {
    var page: Page
    var body: some View {
        VStack(spacing: 20, content: {
            if page.imageUrl.count == 2 {
                VStack{
                    Image("\(page.imageUrl[0])")
                        .resizable()
                        .scaledToFit()
                    Image("\(page.imageUrl[1])")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                .cornerRadius(30)
                .background(.gray.opacity(0.10))
                .cornerRadius(10)
                .padding()
            } else{
                Image("\(page.imageUrl[0])")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .cornerRadius(30)
                    .background(.gray.opacity(0.10))
                    .cornerRadius(10)
                    .padding()
            }
            Text(page.name)
                .font(.title)
            
            Text(page.description)
                .font(.subheadline)
                .frame(width: 300)
        })
    }
}

#Preview {
    RuleView(page: Page.samplePage)
}
