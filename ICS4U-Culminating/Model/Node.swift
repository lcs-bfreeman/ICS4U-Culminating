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
    let ending: Ending
}

let emptyNode = Node(id: 0, paragraphs: [], image: "", edges: [], ending: Ending(nodeID: 0, ending: false, death: false))

let nodes: [Int: Node] = [

    1 : Node(id: 1,
             paragraphs: ["You find yourself walking down the street after a night out with friends. Everything is as it should be, the weather is normal and the sounds of animals and critters alike are as they should be. The only thought on your mind is the start of your painful workday tomorrow at the London Museum.", "On your way home, you hear a strange man calling out to you.  You wonder if he is actually real and continue to walk down the street.  You hear the strange man again, asking you to hear him out, saying that it would be worth your while.  Do you:"],
             image: "Node 1",
             edges: [
                Edge(destinationId: 2, prompt: "Hear out the strange man and his stories."),
                Edge(destinationId: 27, prompt: "Run away in fear."),
                Edge(destinationId: 28, prompt: "Pretend as if you don’t see him.")],
             ending: Ending(nodeID: 1, ending: false, category: "none")),
    2 : Node(id: 2,
             paragraphs: ["He tells you of an old folk tale that you remember vaguely. You suddenly remember that your father used to tell you this story as a child.  When you father passed, you committed yourself to working at the London museum in his memory. The stories about the long-lost secrets and treasures of the London museum also influenced your decision to work at the museum. You hoped that by working there, you would be able to find closure on whether the stories were true or not.  Up until this point, there has been no mention of any treasures or secrets at the museum.", "The mysterious man tells you that part of this folk tale is true and that there is treasure hidden beneath the London museum.  This piques your curiosity.  He tells you to get into his van if you are interested in learning more.  Do you:"],
             image: "Node 2",
             edges: [
                Edge(destinationId: 3, prompt: "Get into his van."),
                Edge(destinationId: 26, prompt: "Begin to get suspicious and tell him you're not interested.")],
             ending: Ending(nodeID: 2, ending: false, category: "none")),
    3 : Node(id: 3,
             paragraphs: ["He takes you around the corner and opens the door to his van.  You step into the van and take a seat. The door closes behind you with a thud.  It's surprisingly comfortable – almost too comfortable. Before you can do anything, you begin to feel drowsy and slowly pass out in the seat. When you wake up you are in what looks like your bedroom. Everything in this room is  identical to your room as a child from before your father passed. The man from earlier opens the door and walks over to you.", "He has something clenched in his hand.  He opens his hand and offers you two pills: a blue pill and a red pill. “Take the blue pill and you can leave. Take the red pill and you will have changed the course of your life.  But remember, once you have started on this path, you cannot change it.” Before you choose a pill, you ask him what his name is, to which he replies “That is not important to our journey, if the time is ever right I may tell you but until then there is no need to know it.” Do you take the…"],
             edges: [
                Edge(destinationId: 4, prompt: "Blue Pill."),
                Edge(destinationId: 5, prompt: "Red Pill.")],
             ending: Ending(nodeID: 3, ending: false, category: "none")),
    4 : Node(id: 4,
             paragraphs: ["", "The End."],
             edges: [],
             ending: Ending(nodeID: 4, ending: true, category: "death")),
    5 : Node(id: 5,
             paragraphs: <#T##[String]#>,
             edges: [
                Edge(destinationId: 6, prompt: "Continue listening.")],
             ending: Ending(nodeID: 5, ending: false, category: "none")),
    6 : Node(id: 6,
             paragraphs: <#T##[String]#>,
             edges: [
                Edge(destinationId: 7, prompt: "Yes.")],
             ending: Ending(nodeID: 6, ending: false, category: "none")),
    7 : Node(id: 7,
             paragraphs: <#T##[String]#>,
             edges: [
                Edge(destinationId: 8, prompt: "Try heating the rock to break it."),
                Edge(destinationId: 9, prompt: "Try freezing the rock to break it.")],
             ending: Ending(nodeID: 7, ending: false, category: "none")),
    8 : Node(id: 8,
             paragraphs: ["", "The End."],
             edges: [],
             ending: Ending(nodeID: 8, ending: true, category: "death")),
    9 : Node(id: 9,
             paragraphs: <#T##[String]#>,
             edges: [
             Edge(destinationId: 10, prompt: <#T##String#>),
             Edge(destinationId: 11, prompt: <#T##String#>)],
             ending: Ending(nodeID: 9, ending: false, category: "none")),
    10 : Node(id: 10,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 12, prompt: <#T##String#>),
              Edge(destinationId: 13, prompt: <#T##String#>)],
              ending: Ending(nodeID: 10, ending: false, category: "none")),
    11 : Node(id: 11,
              paragraphs: ["", "The End."],
              edges: [],
              ending: Ending(nodeID: 11, ending: true, category: "death")),
    12 : Node(id: 12,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 13, prompt: <#T##String#>)],
              ending: Ending(nodeID: 12, ending: false, category: "none")),
    13: Node(id: 13,
             paragraphs: <#T##[String]#>,
             edges: [
             Edge(destinationId: 14, prompt: <#T##String#>)],
             ending: Ending(nodeID: 13, ending: false, category: "none")),
    14 : Node(id: 14,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 15, prompt: <#T##String#>)],
              ending: Ending(nodeID: 14, ending: false, category: "none")),
    15 : Node(id: 15,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 16, prompt: <#T##String#>),
              Edge(destinationId: 17, prompt: <#T##String#>)],
              ending: Ending(nodeID: 15, ending: false, category: "none")),
    16 : Node(id: 16,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 16, ending: true, category: "death")),
    17 : Node(id: 17,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 18, prompt: <#T##String#>)],
              ending: Ending(nodeID: 17, ending: false, category: "none")),
    18 : Node(id: 18,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 19, prompt: <#T##String#>),
              Edge(destinationId: 20, prompt: <#T##String#>)],
              ending: Ending(nodeID: 18, ending: false, category: "none")),
    19 : Node(id: 19,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 19, ending: true, category: "ok")),
    20 : Node(id: 20,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 21, prompt: <#T##String#>),
              Edge(destinationId: 22, prompt: <#T##String#>)],
              ending: Ending(nodeID: 20, ending: false, category: "none")),
    21 : Node(id: 21,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 21, ending: true, category: "death")),
    22 : Node(id: 22,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 23, prompt: <#T##String#>)],
              ending: Ending(nodeID: 22, ending: false, category: "none")),
    23 : Node(id: 23,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 24, prompt: <#T##String#>),
              Edge(destinationId: 25, prompt: <#T##String#>)],
              ending: Ending(nodeID: 23, ending: false, category: "none")),
    24 : Node(id: 24,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 24, ending: true, category: "false")),
    25 : Node(id: 25,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 25, ending: true, category: "best")),
    26 : Node(id: 26,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 33, prompt: <#T##String#>)],
              ending: Ending(nodeID: 26, ending: false, category: "none")),
    27 : Node(id: 27,
              paragraphs: <#T##[String]#>,
              edges: [
                Edge(destinationId: 29, prompt: <#T##String#>)],
              ending: Ending(nodeID: 27, ending: false, category: "none")),
    28 : Node(id: 28,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 30, prompt: <#T##String#>)],
              ending: Ending(nodeID: 28, ending: false, category: "none")),
    29 : Node(id: 29,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 29, ending: true, category: "death")),
    30 : Node(id: 30,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 31, prompt: <#T##String#>),
              Edge(destinationId: 32, prompt: <#T##String#>)],
              ending: Ending(nodeID: 30, ending: false, category: "none")),
    31 : Node(id: 31,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 3, prompt: <#T##String#>)],
              ending: Ending(nodeID: 31, ending: false, category: "none")),
    32 : Node(id: 32,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 32, ending: true, category: "bad")),
    33 : Node(id: 33,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 34, prompt: <#T##String#>),
              Edge(destinationId: 35, prompt: <#T##String#>)],
              ending: Ending(nodeID: 33, ending: false, category: "none")),
    34 : Node(id: 34,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 34, ending: true, category: "medium")),
    35 : Node(id: 35,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 36, prompt: <#T##String#>),
              Edge(destinationId: 37, prompt: <#T##String#>)],
              ending: Ending(nodeID: 35, ending: false, category: "none")),
    36 : Node(id: 36,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 37, prompt: <#T##String#>),
              Edge(destinationId: 38, prompt: <#T##String#>)],
              ending: Ending(nodeID: 36, ending: false, category: "none")),
    37 : Node(id: 37,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 3, prompt: <#T##String#>)],
              ending: Ending(nodeID: 37, ending: false, category: "none")),
    38 : Node(id: 38,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 39, prompt: <#T##String#>)],
              ending: Ending(nodeID: 38, ending: false, category: "none")),
    39 : Node(id: 39,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 40, prompt: <#T##String#>),
              Edge(destinationId: 41, prompt: <#T##String#>)],
              ending: Ending(nodeID: 39, ending: false, category: "none")),
    40 : Node(id: 40,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 40, ending: true, category: "death")),
    41 : Node(id: 41,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 42, prompt: <#T##String#>)],
              ending: Ending(nodeID: 41, ending: false, category: "none")),
    42 : Node(id: 42,
              paragraphs: <#T##[String]#>,
              edges: [],
              ending: Ending(nodeID: 42, ending: true, category: "good")),
    43 : Node(id: 43,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 34, prompt: <#T##String#>),
              Edge(destinationId: 44, prompt: <#T##String#>)],
              ending: Ending(nodeID: 43, ending: false, category: "none")),
    44 : Node(id: 44,
              paragraphs: <#T##[String]#>,
              edges: [
              Edge(destinationId: 37, prompt: <#T##String#>),
              Edge(destinationId: 38, prompt: <#T##String#>)],
              ending: Ending(nodeID: 44, ending: false, category: "none")),
]
