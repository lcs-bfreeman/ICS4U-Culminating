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
             ending: Ending(nodeID: 1, ending: false, death: false)),
    2 : Node(id: 2,
             paragraphs: ["He tells you of an old folk tale that you remember vaguely. You suddenly remember that your father used to tell you this story as a child.  When your father passed, you committed yourself to working at the London museum in his memory. The stories about the long-lost secrets and treasures of the London museum also influenced your decision to work at the museum. You hoped that by working there, you would be able to find closure on whether the stories were true or not.  Up until this point, there has been no mention of any treasures or secrets at the museum.", "The mysterious man tells you that part of this folk tale is true and that there is treasure hidden beneath the London museum.  This piques your curiosity.  He tells you to get into his van if you are interested in learning more.  Do you:"],
             image: "Node 2",
             edges: [
                Edge(destinationId: 3, prompt: "Get into his van."),
                Edge(destinationId: 26, prompt: "Begin to get suspicious and tell him you're not interested.")],
             ending: Ending(nodeID: 2, ending: false, death: false)),
    3 : Node(id: 3,
             paragraphs: ["He takes you around the corner and opens the door to his van.  You step into the van and take a seat. The door closes behind you with a thud.  It's surprisingly comfortable – almost too comfortable. Before you can do anything, you begin to feel drowsy and slowly pass out in the seat. When you wake up you are in what looks like your bedroom. Everything in this room is  identical to your room as a child from before your father passed. The man from earlier opens the door and walks over to you.", "He has something clenched in his hand.  He opens his hand and offers you two pills: a blue pill and a red pill. “Take the blue pill and you can leave. Take the red pill and you will have changed the course of your life.  But remember, once you have started on this path, you cannot change it.” Before you choose a pill, you ask him what his name is, to which he replies “That is not important to our journey, if the time is ever right I may tell you but until then there is no need to know it.” Do you take the…"],
             image: "",
             edges: [
                Edge(destinationId: 4, prompt: "Blue Pill."),
                Edge(destinationId: 5, prompt: "Red Pill.")],
             ending: Ending(nodeID: 3, ending: false, death: false)),
    4 : Node(id: 4,
             paragraphs: ["You take the blue pill. You immediately start to suffocate. Your throat closes inwards and as you take your last breath the last words you hear are “Sorry but this is a deal you can’t get out of. I can’t have any loose ends.  You had already started the path the moment you stepped in the van, you just didn’t know it. The only path that strays from the one you're on now leads to death's door and you just followed it.", "The End."],
             image: "",
             edges: [],
             ending: Ending(nodeID: 4, ending: true, death: true)),
    5 : Node(id: 5,
             paragraphs: ["The un-named man starts speaking again. He tells you that there was never really a choice and that it was more a test of faith. The pill has no effect."],
             image: "",
             edges: [
                Edge(destinationId: 6, prompt: "Continue listening.")],
             ending: Ending(nodeID: 5, ending: false, death: false)),
    6 : Node(id: 6,
             paragraphs: ["“Now you may be wondering what exactly this project is. All you need to know is that it is high risk, high reward. We need your connection to the London Museum. It is a front for the royal vault. It is an accumulation of all the gold and treasure acquired during the entirety of the British empire estimated at 10 Billion pounds. All we have to do is enter the vault and it's ours. In the old Monarch laws it states that whoever shall enter the vault without royal blood shall hold the riches within. Seems simple enough right?” You simply answer with “yes”. Wrong."],
             image: "",
             edges: [
                Edge(destinationId: 7, prompt: "Yes.")],
             ending: Ending(nodeID: 6, ending: false, death: false)),
    7 : Node(id: 7,
             paragraphs: ["“It may seem simple but the entrance consists of 3 puzzles. One wrong guess and you will end up just as your late father. He was the only man to ever complete the first puzzle however what you may not know is that he didn’t die in a plane crash… he died to puzzle number two. Hundreds of people have tried yet your father is the closest of any and he still failed. This is the second reason we need you. We believe that your father left you the key to the first puzzle. It’s the only key we don’t already know how to get.” The only thing your father left you was a glass case with a rock. You agree to investigate it as you don’t really have another option. You find the rock but it feels off. It feels hollow. You need to find a way to open it do you…"],
             image: "",
             edges: [
                Edge(destinationId: 8, prompt: "Try heating the rock to break it."),
                Edge(destinationId: 9, prompt: "Try freezing the rock to break it.")],
             ending: Ending(nodeID: 7, ending: false, death: false)),
    8 : Node(id: 8,
             paragraphs: ["When you go to break the rock to no surprise you see liquid gold flowing out of it. You have melted the key. The plan is ruined and the riches lost forever. Knowing the consequences of destroying the key you flee the country never to be seen again…", "The End."],
             image: "",
             edges: [],
             ending: Ending(nodeID: 8, ending: true, death: true)),
    9 : Node(id: 9,
             paragraphs: ["Now that you have the key it must be kept safe. You can keep the key or give it to the mysterious man who seems to be in control of this project."],
             image: "",
             edges: [
             Edge(destinationId: 10, prompt: "You choose to hold onto it yourself till the start of the heist."),
             Edge(destinationId: 11, prompt: "You choose to give it to the mysterious man for protection.")],
             ending: Ending(nodeID: 9, ending: false, death: false)),
    10 : Node(id: 10,
              paragraphs: ["Now that all the pieces for the heist have been attained you must make the decision of time. Do you want to begin your heist at day or night?"],
              image: "",
              edges: [
              Edge(destinationId: 12, prompt: "You choose to start at day."),
              Edge(destinationId: 13, prompt: "You choose to start at night.")],
              ending: Ending(nodeID: 10, ending: false, death: false)),
    11 : Node(id: 11,
              paragraphs: ["You meet up with the man and hand him the key. It hits you as the key is pulled from your hands. You have just given up your only bargaining chip. The look on your face fades as a sharp pain hits your side. Neuro toxins. You are no longer necessary to the project. You are disposable. You are dead.", "The End."],
              image: "",
              edges: [],
              ending: Ending(nodeID: 11, ending: true, death: true)),
    12 : Node(id: 12,
             paragraphs: [""],
              image: "",
              edges: [
                Edge(destinationId: 13, prompt: "You come back at night.")],
              ending: Ending(nodeID: 11, ending: false, death: false)),
    13 : Node(id: 13,
             paragraphs: ["You meet the man at the back of the museum. He directs you through a manhole and into the basement of the museum. You have only been here once before. This is a new level of eerie you have never felt before. Every bone in your body is telling you this is wrong but you continue. You get to the first puzzle. It is the biggest vault door you have ever seen and the only lit part of the room lays by a tiny key hole. The man motions you to it. You take out the key hands shaking as if you had just seen a ghost. You turn the key and after a loud click and whir the door swings open. It amazes you that a door that big could even be moved."],
              image: "",
              edges: [
                Edge(destinationId: 14, prompt: "")],
              ending: Ending(nodeID: 11, ending: false, death: false)),
    
    
]
