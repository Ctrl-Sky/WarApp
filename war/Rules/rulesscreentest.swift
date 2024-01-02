//
//  rulesscreentest.swift
//  war
//
//  Created by Sky Quan on 2023-11-28.
//

import SwiftUI

struct RulesScreenTest: View {
    @State var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    @Binding var path: NavigationPath
    
    
    
    var body: some View {
        
        TabView(selection: $pageIndex){
            ForEach(pages) { page in
                VStack{
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    if page == pages.last {
                        Button(action: goToZero, label: {
                            Text("Button")
                        })
                    } else {
                        Button("next", action: incrementPage)
                    }
                    Spacer()
                }
                .tag(page.tag)
            }
        }
        .navigationBarBackButtonHidden(true)
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
//https://www.swiftyplace.com/blog/tabview-in-swiftui-styling-navigation-and-more#:~:text=SwiftUI%20TabView%20is%20a%20main,bar%20items%20at%20the%20bottom.
    
    func incrementPage(){
        pageIndex = (pageIndex + 1) % 3
    }
    
    func goToZero(){
        path.removeLast(path.count)
    }
}

#Preview {
    RulesScreenTest(path: .constant(NavigationPath()))
}
