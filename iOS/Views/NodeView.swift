//
//  NodeView.swift
//  ICS4U-Culminating
//
//  Created by Ben Freeman on 2022-05-31.
//

import SwiftUI

struct NodeView: View {
    
    let node: Node
    
    @Binding var activeNode: Int

    @Binding var bestEndingsFound: Int
    
    @Binding var goodEndingsFound: Int
    
    @Binding var okEndingsFound: Int
    
    @Binding var badEndingsFound: Int
    
    @Binding var deathEndingsFound: Int
    
    @Binding var endingsFound: [Int]
    
    var image: String {
        return node.image ?? ""
    }
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(node.id)")
                
                ForEach(node.paragraphs, id: \.self) { currentParagraph in
                    Text(currentParagraph)
                        .padding()
                    
                }
                
                if Image(image) != Image("") {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                }
                ForEach(node.edges, id: \.self) { currentEdge in
                    HStack {
                        
                        Spacer()
                        
                        Text(currentEdge.prompt)
                            .padding()
                            .multilineTextAlignment(.trailing)
                            .onTapGesture {
                                activeNode = currentEdge.destinationId
                            }
                    }
                }
                if node.ending != nil {
                    HStack {
                        Spacer()
                        Button("Restart") {
                            atEnding()
                            addEnding()
                        }
                        .font(.system(size: 45))
                        Spacer()
                    }
                }
            }
        }
    }
    
    func atEnding() {
        if node.ending != nil {
            activeNode = 0
        }
    }
    func addEnding() {
        if endingsFound.contains(node.id) {
            endingsFound = endingsFound
        }  else {
            endingsFound.append(node.id)
            if node.ending?.classification == .best {
                bestEndingsFound += 1
            } else if node.ending?.classification == .good {
                goodEndingsFound += 1
            } else if node.ending?.classification == .ok {
                okEndingsFound += 1
            } else if node.ending?.classification == .bad {
                badEndingsFound += 1
            } else if node.ending?.classification == .death {
                deathEndingsFound += 1
            } 
        }
    }
}

//struct NodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NodeView(currentNode: <#Node#>)
//    }
//}
