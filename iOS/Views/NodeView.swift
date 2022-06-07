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
}

//struct NodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NodeView(currentNode: <#Node#>)
//    }
//}
