//
//  Node.swift
//  ICS4U-Culminating
//
//  Created by Hayden Couch on 2022-05-27.
//

import Foundation

struct Node: Identifiable {
    let id: Int
    let paragraphs: [String]
    let image: String?
    let edges: [Edge]
    
}

struct Edge {
    let destinationId: Int
    let prompt: String
}


let nodes = [

    Node(id: 1,
         paragraphs: ["Example"],
         image: <#T##String?#>,
         edges: []
    ),

]
