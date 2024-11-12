//
//  Rules.swift
//  hackathon-inc-2024-g17
//
//  Created by Dhanush  on 12/11/24.
//

import SwiftUI

struct Rules: View {
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    Section(header: Text("Rule #1")) {
                        Text("Players take turns placing their respective juice (orange or apple) on any open space represented by the cups.")
                    }
                    Section(header: Text("Rule #2")) {
                        Text("Upon the 3rd turn, players can start drinking, which essentially allows players to remove theirs or opponents spaces. Drinking uses up a turn. Throughout a single game, a player can only drink up to 3 juices.")
                    }
                    Section(header: Text("Rule #3")) {
                        Text("As with normal tic tac toe, first player to get 3 in a row will win, if all spaces are covered, no player has won, and all drinks are used up, it results in a tie.")
                    }
                    Section(header: Text("Rule #4"), footer: Text("Please do not fight, or shout if you lose a game.")) {
                        Text("Have fun!")
                    }
                }
            }
            .navigationTitle("Rules")
        }
    }
}

#Preview {
    Rules()
}
