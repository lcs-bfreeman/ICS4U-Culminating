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


let nodes = [

    Node(id: 1,
         paragraphs: ["You find yourself walking down the street after a night out with friends. Everything is as it should be, the weather is normal and the sounds of animals and critters alike are as they should be. The only thought on your mind is the start of your painful workday tomorrow at the London Museum.", "On your way home, you hear a strange man calling out to you.  You wonder if he is actually real and continue to walk down the street.  You hear the strange man again, asking you to hear him out, saying that it would be worth your while.  Do you:"],
         image: "Node 1",
         edges: [
            Edge(destinationId: 2, prompt: "Hear out the strange man and his stories."),
            Edge(destinationId: <#T##Int#>, prompt: "Run away in fear."),
            Edge(destinationId: <#T##Int#>, prompt: "Pretend as if you don’t see him.")
         ],
         ending: Ending(nodeID: 1, ending: false, death: false)
    ),
    Node(id: 2,
         paragraphs: ["He tells you of an old folk tale that you remember vaguely. You suddenly remember that your father used to tell you this story as a child.  When you father passed, you committed yourself to working at the London museum in his memory. The stories about the long-lost secrets and treasures of the London museum also influenced your decision to work at the museum. You hoped that by working there, you would be able to find closure on whether the stories were true or not.  Up until this point, there has been no mention of any treasures or secrets at the museum.", "The mysterious man tells you that part of this folk tale is true and that there is treasure hidden beneath the London museum.  This piques your curiosity.  He tells you to get into his van if you are interested in learning more.  Do you:"],
         image: "Node 2",
         edges: [
         Edge(destinationId: 3, prompt: "Get into his van."),
         Edge(destinationId: <#T##Int#>, prompt: "Begin to get suspicious and tell him you're not interested.")
         ],
         ending: Ending(nodeID: 2, ending: false, death: false))
],
    Node(id: 3,
         paragraphs: ["He takes you around the corner and opens the door to his van.  You step into the van and take a seat. The door closes behind you with a thud.  It's surprisingly comfortable – almost too comfortable. Before you can do anything, you begin to feel drowsy and slowly pass out in the seat. When you wake up you are in what looks like your bedroom. Everything in this room is  identical to your room as a child from before your father passed. The man from earlier opens the door and walks over to you.", "He has something clenched in his hand.  He opens his hand and offers you two pills: a blue pill and a red pill. “Take the blue pill and you can leave. Take the red pill and you will have changed the course of your life.  But remember, once you have started on this path, you cannot change it.” Before you choose a pill, you ask him what his name is, to which he replies “That is not important to our journey, if the time is ever right I may tell you but until then there is no need to know it.” Do you take the…"],
         edges: [
            Edge(destinationId: 4, prompt: "Blue Pill."),
            Edge(destinationId: 5, prompt: "Red Pill.")
    ],   ending: Ending(nodeID: 3, ending: false, death: false))
    
