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
            VStack(alignment: .leading){
                Text("\(node.id)")
                
                ForEach(node.paragraphs, id: \.self) { currentParagraph in
                    Text(currentParagraph)
                        .padding()
                    
                }
                
                    Image(image)
                        .resizable()
                        .scaledToFit()
                
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
                
            }
        }
        
    }
}

//struct NodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NodeView(currentNode: <#Node#>)
//    }
//}
