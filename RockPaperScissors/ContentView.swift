//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Adri on 29/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userOptions = ["✊🏻", "🖐🏻", "✌🏻"]
    @State private var hasToWin = Bool.random()
    @State private var randomChoice = Int.random(in: 0...2)
    @State private var score = 0
    @State private var rounds = 1
    @State private var gameEnded = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .yellow, location: 0.6),
                .init(color: .indigo, location: 0.1),
                
            ], center: .top, startRadius: 0, endRadius: 450)
            .ignoresSafeArea()
            
            VStack(spacing: 15) {
                VStack(spacing: 30) {
                    HStack {
                        Text("Try to")
                        Text(hasToWin ? " Win" : "Lose")
                            .font(.system(size: 25))
                            .bold()
                    }
                    Text("\(userOptions[randomChoice])")
                        .font(.system(size: 90))
                    Text("⚡️")
                        .font(.system(size: 70))
                        .fontWeight(.ultraLight)
                }
                HStack(spacing: 15) {
                    ForEach(userOptions, id: \.self) { option in
                        Button {
                            checkAnswer(option)
                        } label: {
                            Text("\(option)")
                                .font(.system(size:50))
                        }
                    }
                }
                .padding()
                
                Text("Actual score: \(score)")
                    .font(.system(size: 20))
                
            }.alert("The game has ended", isPresented: $gameEnded) {
                Button("New game", action: resetGame)
            } message: {
                Text("Your final score is: \(score)")
            }
        }
        
    }
    
    func checkAnswer(_ option: String) -> Void {
        getScore(option)
        if rounds == 4 {
            gameEnded = true
        } else {
            userOptions.shuffle()
            hasToWin.toggle()
            randomChoice = Int.random(in: 0...2)
            rounds += 1
        }
    }
    
    func resetGame() {
        score = 0
        rounds = 0
    }
    
    func getScore(_ option: String) {
        if option == "✊🏻" && userOptions[randomChoice] == "🖐🏻" && hasToWin  {
            score -= 1
        } else if option == "✊🏻" && userOptions[randomChoice] == "🖐🏻" && !hasToWin  {
            score += 1
        } else if option == "✊🏻" && userOptions[randomChoice] == "✌🏻" && hasToWin  {
            score += 1
        } else if option == "✊🏻" && userOptions[randomChoice] == "✌🏻" && !hasToWin  {
            score -= 1
        } else if option == "🖐🏻" && userOptions[randomChoice] == "✊🏻" && hasToWin  {
            score += 1
        } else if option == "🖐🏻" && userOptions[randomChoice] == "✊🏻" && !hasToWin  {
            score -= 1
        } else if option == "🖐🏻" && userOptions[randomChoice] == "✌🏻" && hasToWin  {
            score -= 1
        } else if option == "🖐🏻" && userOptions[randomChoice] == "✌🏻" && !hasToWin  {
            score += 1
        } else if option == "✌🏻" && userOptions[randomChoice] == "✊🏻" && hasToWin  {
            score -= 1
        } else if option == "✌🏻" && userOptions[randomChoice] == "✊🏻" && !hasToWin  {
            score += 1
        } else if option == "✌🏻" && userOptions[randomChoice] == "🖐🏻" && hasToWin  {
            score += 1
        } else if option == "✌🏻" && userOptions[randomChoice] == "🖐🏻" && !hasToWin  {
            score += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
