//
//  RulesScreen.swift
//  war
//
//  Created by Sky Quan on 2023-11-23.
//

import SwiftUI

struct RulesScreen: View {
    @State var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    @Binding var path: NavigationPath
    
    
    
    var body: some View {
        
        TabView(selection: $pageIndex){
            ForEach(pages) { page in
                VStack{
                    Spacer()
                    RuleView(page: page)
                    Spacer()
                    if page == pages.last {
                        Button(action: goToZero, label: {
                            Text("Return to Game")
                        })
                        .buttonStyle(.bordered)
                    } else {
                        Button("Next", action: incrementPage)
                            .buttonStyle(.bordered)
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
        pageIndex += 1
    }
    
    func goToZero(){
        path.removeLast(path.count)
    }
}

#Preview {
    RulesScreen(path: .constant(NavigationPath()))
}
