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
    let ending: Bool
}


let nodes = [

    Node(id: 1,
         paragraphs: ["Example"],
         image: <#T##String?#>,
         edges: []
    ),

]
