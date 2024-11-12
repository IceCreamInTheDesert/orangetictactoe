//
//  Home.swift
//  hackathon-inc-2024-g17
//
//  Created by Dhanush  on 12/11/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Fruit Fight")
                    .font(.system(size: 75))
                    .fontWeight(.bold)
                
                NavigationLink{
                    Game()
                } label: {
                    Button{
                        
                    } label: {
                            HStack{
                                Image(systemName: "play.fill")
                                Text("Fight!")
                            }
                            .frame(width: 300, height: 100)
                            .background(                            Color(UIColor(red: 247/255, green: 159/255, blue: 31/255, alpha: 1)))
                            .cornerRadius(20)
                            .foregroundStyle(.white)
                    }
                }
                
                NavigationLink{
                    Rules()
                } label: {
                    Button{
                        
                    } label: {
                        HStack{
                            Image(systemName: "book.pages.fill")
                            Text("Rules")
                        }
                        .frame(width: 300, height: 100)
                        .background(                            Color(UIColor(red: 247/255, green: 159/255, blue: 31/255, alpha: 1)))
                        .cornerRadius(20)
                        .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    Home()
}
