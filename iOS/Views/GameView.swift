//
//  GameView.swift
//  iOS
//
//  Created by Ben Freeman on 2022-06-01.
//

import SwiftUI

struct GameView: View {
    @State var activeNode = 0
    
    var gameIsOn: Bool{
        return activeNode > 0
    }
    
    var currentNode: Node {
        return nodes[activeNode] ?? emptyNode
    }
    
    var body: some View {
        if gameIsOn == false {
            //welcome screen
            Text("Wlecome")
                .onTapGesture {
                    startGame()
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
