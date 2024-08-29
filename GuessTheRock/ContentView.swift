//
//  ContentView.swift
//  GuessTheRock
//
//  Created by Mykola Chaikovskyi on 29.08.2024.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    
    @State private var score = 0
    @State private var appChoice = Int.random(in: 0..<3)
    @State private var shouldPlayerWin = Bool.random()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .indigo, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("You are attacked with \(moves[appChoice]).")
                    .foregroundStyle(.white)
                    .font(.headline)
                Text("You should \(shouldPlayerWin ? "win" : "lose").")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                Group {
                    Button("🪨 Rock") {
                        
                    }
                    .font(.largeTitle.bold())
                    Button("📄 Paper") {
                        
                    }
                    .font(.largeTitle.bold())
                    Button("✂️ Scissors") {
                        
                    }
                    .font(.largeTitle.bold())
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.white)
            }
        }
    }
    
    func analyzePlayerMove(move: Int) {
        if moves[move] == winningMoves[appChoice] {
            if shouldPlayerWin {
                score += 1
            }
        }
        
        if !shouldPlayerWin {
            score += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
