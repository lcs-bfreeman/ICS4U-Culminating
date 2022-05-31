//
//  mainView.swift
//  ICS4U-Culminating
//
//  Created by Brad Kang on 2022-05-30.
//

import SwiftUI

struct mainView: View {
    
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

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}
