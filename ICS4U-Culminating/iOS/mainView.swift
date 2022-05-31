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
    
    var body: some View {
        if gameIsOn == false {
            //welcome screen
            Text("Wlecome")
                .onTapGesture {
                    startGame()
                }
        } else {
            // Game begin's
            
            Text("Game is on")
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
