//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Adri on 29/1/23.
//

import SwiftUI

struct ContentView: View {
    
    private var userOptions = ["Rock", "Paper", "Scissors"]
    @State private var hasToWin = Bool.random()
    @State private var randomChoice = Int.random(in: 0...2)
    @State private var score = 0
    @State private var rounds = 1
    @State private var gameEnded = false
    
    var body: some View {
        VStack(spacing: 15) {
            VStack {
                Text("\(userOptions[randomChoice])")
            }
            HStack {
                ForEach(userOptions, id: \.self) { option in
                    Button {
                        checkAnswer(option)
                    } label: {
                        Text("\(option)")
                    }
                    
                }
            }
            .padding()
            
            Text(hasToWin ? "You have to Win" : "You have to  Lose")
            Text("Actual score: \(score)")
            
        }.alert("The game has ended", isPresented: $gameEnded) {
            Button("New game", action: resetGame)
        } message: {
            Text("Your final score is: \(score)")
        }
    }
    
    func checkAnswer(_ option: String) -> Void {
        getScore(option)
        if rounds == 4 {
            gameEnded = true
        } else {
            hasToWin = Bool.random()
            randomChoice = Int.random(in: 0...2)
            rounds += 1
        }
    }
    
    func resetGame() {
        score = 0
        rounds = 0
    }
    
    func getScore(_ option: String) {
        if option == "Rock" && userOptions[randomChoice] == "Paper" && hasToWin  {
            score -= 1
        } else if option == "Rock" && userOptions[randomChoice] == "Paper" && !hasToWin  {
            score += 1
        } else if option == "Rock" && userOptions[randomChoice] == "Scissors" && hasToWin  {
            score += 1
        } else if option == "Rock" && userOptions[randomChoice] == "Scissors" && !hasToWin  {
            score -= 1
        } else if option == "Paper" && userOptions[randomChoice] == "Rock" && hasToWin  {
            score += 1
        } else if option == "Paper" && userOptions[randomChoice] == "Rock" && !hasToWin  {
            score -= 1
        } else if option == "Paper" && userOptions[randomChoice] == "Scissors" && hasToWin  {
            score -= 1
        } else if option == "Paper" && userOptions[randomChoice] == "Scissors" && !hasToWin  {
            score += 1
        }  else if option == "Scissors" && userOptions[randomChoice] == "Rock" && hasToWin  {
            score -= 1
        }  else if option == "Scissors" && userOptions[randomChoice] == "Rock" && !hasToWin  {
            score += 1
        }   else if option == "Scissors" && userOptions[randomChoice] == "Paper" && hasToWin  {
            score += 1
        }   else if option == "Scissors" && userOptions[randomChoice] == "Paper" && !hasToWin  {
            score += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
