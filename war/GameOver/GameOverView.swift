//
//  GameOverView.swift
//  war
//
//  Created by Sky Quan on 2023-11-28.
//

import SwiftUI

struct GameOverView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var GameOverModel: GameOverPage
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Game Over")
                    .font(.system(size: 65))
                    .fontWeight(.bold)
                Text("Final Score")
                    .font(.largeTitle)
                    .padding(.top)
                
                HStack{
                    Spacer()
                    VStack{
                        Text("PLAYER")
                            .font(.headline)
                            .padding()
                        Text(String(GameOverModel.playerScore))
                            .font(.largeTitle)
                        
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding()
                        Text(String(GameOverModel.cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                
                Text("The Winner is:")
                    .font(.title)
                    .padding(.top)
                
                if GameOverModel.playerScore > GameOverModel.cpuScore{
                    Text("Player!")
                        .font(.title2)
                        .padding(50.0)
                }
                else if GameOverModel.playerScore < GameOverModel.cpuScore{
                    Text("CPU!")
                        .font(.title2)
                        .padding(50.0)
                }
                else{
                    Text("Its a Tie!")
                        .font(.title2)
                        .padding(50.0)
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Play Again")
                })
                .padding()
                .buttonStyle(.bordered)
                .tint(.white)
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    GameOverView(GameOverModel: GameOverPage.samplePage)
}
