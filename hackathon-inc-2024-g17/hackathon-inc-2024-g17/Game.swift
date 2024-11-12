//
//  Game.swift
//  hackathon-inc-2024-g17
//
//  Created by Dhanush  on 12/11/24.
//

import SwiftUI

enum Player: String {
    case x = "X"
    case o = "O"
}
extension Color {
    init(hex: Int) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255
            
        )
    }
}
struct Game: View {
    @State private var currentPlayer: Player = .x
    @State private var cells: [[Player?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    @State private var winner: Player?
    @State private var isDraw: Bool = false
    @State private var winningCells: Set<[Int]> = []
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .padding(.vertical)
            
            Spacer()
            
            if winner == nil && isDraw == false{
                Text("Player \(currentPlayer.rawValue)'s turn")
                    .foregroundColor(currentPlayer == .x ? .red : .blue)
            }
            
            
            ForEach(0..<3) { row in
                HStack(spacing: 20) {
                    ForEach(0..<3) { column in
                        Button(action: {
                            if cells[row][column] == nil {
                                cells[row][column] = currentPlayer
                                currentPlayer = currentPlayer == .x ? .o : .x
                                checkWinner()
                            }
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(currentColor(row, column))
                                    .frame(width: 80, height: 80)
                                    .shadow(radius: 5)
                                Text(cells[row][column]?.rawValue ?? "")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                        })
                        .disabled(winner == nil ? false : true)
                        .scaleEffect(winningCells.contains([row, column]) ? 1.2 : 1.0)
                    }
                }
            }
            
            Spacer()
            
            if let winner = winner {
                Text("Player \(winner.rawValue) wins!")
                    .foregroundColor(.green)
                    .scaleEffect(2.0)
                    .padding(.vertical)
            } else if isDraw {
                Text("It's a draw!")
                    .foregroundColor(.orange)
                    .scaleEffect(2.0)
                    .padding(.vertical)
            }
            
            Spacer()
            
            Button("Reset Game", action: resetGame)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .padding()
    }
    
    func currentColor(_ row:Int,_ column:Int)->Color{
        if cells[row][column] == .x {
            return Color(hex: 079010)
        }else if cells[row][column] == .o {
            return .blue
        }
        return .gray
    }
    
    private func checkWinner() {
        // Check rows
        for row in 0..<3 {
            if let player = cells[row][0], cells[row][1] == player, cells[row][2] == player {
                winner = player
                winningCells = Set([[row, 0], [row, 1], [row, 2]])
                return
            }
        }
        
        // Check columns
        for column in 0..<3 {
            if let player = cells[0][column], cells[1][column] == player, cells[2][column] == player {
                winner = player
                winningCells = Set([[0, column], [1, column], [2, column]])
                return
            }
        }
        
        // Check diagonal
        if let player = cells[0][0], cells[1][1] == player, cells[2][2] == player {
            winner = player
            winningCells = Set([[0, 0], [1, 1], [2, 2]])
            return
        }
        
        if let player = cells[0][2], cells[1][1] == player, cells[2][0] == player {
            winner = player
            winningCells = Set([[0, 2], [1, 1], [2, 0]])
            return
        }
        
        // Check draw
        if !cells.flatMap({ $0 }).contains(nil) {
            isDraw = true
        }
    }
    
    private func resetGame() {
        currentPlayer = .x
        cells = Array(repeating: Array(repeating: nil, count: 3), count: 3)
        winner = nil
        isDraw = false
        winningCells = Set()
    }
}
struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
