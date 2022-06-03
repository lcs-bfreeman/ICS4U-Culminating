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
    
    var endingsFound = 0
    
    var gameIsOn: Bool{
        return activeNode > 0
    }
    
    var currentNode: Node {
        return nodes[activeNode] ?? emptyNode
    }
    
    var body: some View {
        if gameIsOn == false {
            //welcome screen
            VStack {
                HStack{
                    Button("Endings Found \(endingsFound)/13") {
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
                Text("The Royal Heist")
                    .onTapGesture {
                        startGame()
                        
            }
                Spacer()
                }

            .sheet(isPresented: $openSettings) {
                Text("Test")
            }
            .sheet(isPresented: $openEndings) {
                VStack{
                    Text("Best endings 0/0")
                        .padding()
                    Text("Death endings 0/0")
                        .padding()
                    Text("Ok endings 0/0")
                        .padding()
                    Text("Bad endings 0/0")
                        .padding()
                    Text("Good endings 0/0")
                        .padding()
                }
            }
        } else {
            // Game begin's
            
            NodeView(node: currentNode, activeNode: $activeNode )
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
