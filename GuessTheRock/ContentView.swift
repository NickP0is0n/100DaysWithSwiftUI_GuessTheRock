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
    
    @State private var moveNumber = 1
    @State private var endGame = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .indigo, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("You are attacked with \(moves[appChoice]).")
                    .foregroundStyle(.white)
                    .font(.headline)
                Text("You should \(shouldPlayerWin ? "win" : "lose").")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                Spacer()
                VStack {
                    Group {
                        Button("🪨 Rock") {
                            analyzePlayerMove(move: 0)
                        }
                        .font(.largeTitle.bold())
                        Button("📄 Paper") {
                            analyzePlayerMove(move: 1)
                        }
                        .font(.largeTitle.bold())
                        Button("✂️ Scissors") {
                            analyzePlayerMove(move: 2)
                        }
                        .font(.largeTitle.bold())
                    }
                    .buttonStyle(.bordered)
                    .foregroundStyle(.black)
                    .padding(.bottom)
                }
                .padding(40)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
        }
        .alert("Game over", isPresented: $endGame) {
            Button("New game") {
                score = 0
                moveNumber = 0
                nextMove()
            }
        } message: {
            Text("You have scored \(score) points.")
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
        
        nextMove()
    }
    
    func nextMove() {
        moveNumber += 1
        if moveNumber > 10 {
            endGame = true
        } else {
            appChoice = Int.random(in: 0..<3)
            shouldPlayerWin.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
