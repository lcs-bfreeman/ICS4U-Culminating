//
//  GameView.swift
//  iOS
//
//  Created by Ben Freeman on 2022-06-01.
//

import SwiftUI

struct GameView: View {
    @State var activeNode = 0
    
    @State var openSettings = false
    
    @State var openEndings = false
    
    @State var isAtEnding = false

    @State var bestEndingsFound = 0
    
    @State var goodEndingsFound = 0
    
    @State var okEndingsFound = 0
    
    @State var badEndingsFound = 0
    
    @State var deathEndingsFound = 0

    @State var endingsFound: [Int] = []
    
    @State var fontSize = 30.0
    
    var gameIsOn: Bool{
        return activeNode > 0
    }
    
    var currentNode: Node {
        return nodes[activeNode] ?? emptyNode
    }
    
    var body: some View {
        if gameIsOn == false {
            //welcome screen
            ZStack{
                
                Color.black
                    .ignoresSafeArea()
                
            VStack {
                
                HStack{
                    Button("Endings Found: \(endingsFound.count)/13") {
                        openEndings = true
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button("Settings") {
                        openSettings = true
                    }
                        .padding()
                }
                
                Spacer()
                Image("Royal hist")
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        startGame()
                        
            }
                Spacer()
                }

            }
            


            .sheet(isPresented: $openSettings) {
                Text("Font Size:")
                Slider(value: $fontSize, in: 10...100)
            }
            .sheet(isPresented: $openEndings) {
                
                VStack{
                    Text("Best Endings Found: \(bestEndingsFound)/1")
                        .padding()
                    Text("Good Endings Found: \(goodEndingsFound)/1")
                        .padding()
                    Text("OK Endings Found: \(okEndingsFound)/2")
                        .padding()
                    Text("Bad Endings Found: \(badEndingsFound)/1")
                        .padding()
                    Text("Death Endings Found: \(deathEndingsFound)/8")
                        .padding()


                }
            }
        } else {
            // Game begin's
            
            NodeView(node: currentNode, activeNode: $activeNode, bestEndingsFound: $bestEndingsFound, goodEndingsFound: $goodEndingsFound, okEndingsFound: $okEndingsFound, badEndingsFound: $badEndingsFound, deathEndingsFound: $deathEndingsFound, endingsFound: $endingsFound)
        }
    }
    
    func startGame() {
        activeNode = 1
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
