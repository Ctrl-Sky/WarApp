
//
//  ContentView.swift
//  war
//
//  Created by Sky Quan on 2023-11-13.
//

import SwiftUI

struct ContentView: View {
    var deck = Deck()
    @State private var playerCard = Card(rank: 0, suit: 1)
    @State private var cpuCard = Card(rank: 0, suit: 1)
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    @State private var showSheet: Bool = false
    
    @State private var path = NavigationPath()
    var num = 1
    
    var body: some View {
        
        NavigationStack(path: $path){
                VStack {
                    
                    HStack{
                        Image("WAR")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .multilineTextAlignment(.center)
                    }
                    
                    HStack{
                        Spacer()
                        VStack{
                            Text("Player's Card")
                            Image(playerCard.cardImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 175)
                        }
                        Spacer()
                        VStack{
                            Image(cpuCard.cardImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 175)
                            Text("CPU's Card")
                            
                        }
                        Spacer()
                    }
                    
                    
                    HStack{
                        NavigationLink(value: num){
                            Image("RulesButton")
                                .resizable()
                                .padding(15.0)
                                .scaledToFit()
                        }
                        .navigationBarBackButtonHidden(true)
                        .navigationDestination(for: Int.self) { num in
                            RulesScreen(path: $path)
                        }
                        Button(action: {
                            deal()
                        }, label: {
                            Image("DEAL")
                                .resizable()
                                .scaledToFit()
                        })
                        .padding(.trailing)
                        .fullScreenCover(isPresented: $showSheet, onDismiss: {
                            restart()
                        }, content: {
                            GameOverView(GameOverModel: GameOverPage(playerScore: playerScore, cpuScore: cpuScore))
                        })
                    }
                    
                    HStack{
                        Spacer()
                        VStack{
                            Text("PLAYER")
                                .font(.headline)
                                .padding()
                            Text(String(playerScore))
                                .font(.largeTitle)
                            
                        }
                        Spacer()
                        VStack{
                            Text("CPU")
                                .font(.headline)
                                .padding()
                            Text(String(cpuScore))
                                .font(.largeTitle)
                        }
                        Spacer()
                    }
                    
                }.offset(y: -20)
        }
        
    }
    func restart(){
        deck.refill()
        playerCard = Card(rank: 0, suit: 1)
        cpuCard = Card(rank: 0, suit: 1)
        playerScore = 0
        cpuScore = 0
    }
    
    func deal(){
        let wrappedPlayerCard = deck.draw()
        let wrappedCPUCard = deck.draw()
        
        if wrappedPlayerCard == nil && wrappedCPUCard == nil{
            showSheet.toggle()
        } else {
            
            playerCard = wrappedPlayerCard!
            cpuCard = wrappedCPUCard!
            
            if playerCard.rank > cpuCard.rank{
                playerScore += 1
            }
            else if playerCard.rank < cpuCard.rank{
                cpuScore += 1
            }
            else{
                if playerCard.suit > cpuCard.suit{
                    playerScore += 1
                }
                else if playerCard.suit < cpuCard.suit{
                    cpuScore += 1
                }
            }
        }
    }
}

struct secondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
            })
        }
    }
}

#Preview {
    ContentView()
}

