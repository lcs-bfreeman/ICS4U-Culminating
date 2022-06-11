import Cocoa
import SwiftUI

struct Edge: Hashable {
    
    let destinationId: Int
    let prompt: String
    
}

// TODO: 1 - Add this enumeration to your project
enum EndingClassification: String, CaseIterable {
    case best = "best"
    case good = "good"
    case ok = "ok"
    case bad = "bad"
    case death = "death"
}

// TODO: 2 - Add this structure to your project
struct Ending {
    let classification: EndingClassification
    let description: String
    var color: String {
        switch self.classification {
        case .best:
            return "#90C8E0"  // Light blue
        case .good:
            return "#FFDE5F"  // Pale yellow
        case .ok:
            return "#D7883C"  // Orange
        case .bad:
            return "#C1531E"  // Deep orange
        case .death:
            return "#AB1800"  // Deep red
        }
    }
}

// TODO: 3 - Update your story nodes to use the Ending type
struct Node: Identifiable {
    let id: Int
    let paragraphs: [String]
    let image: String?
    let edges: [Edge]
    let ending: Ending?
}

struct StoryInformation {
    let title: String
    let authorOrAuthors: String
    let seriesInfo: String
    let publisherInfo: String
}

// TODO: 4 - Replace details of this instance of StoryInformation with data for your own group's story
let storyInfo = StoryInformation(title: "The Royal Heist",
                                 authorOrAuthors: "H. Couch, B. Kang, B. Freeman",
                                 seriesInfo: "UK Roadmen #4",
                                 publisherInfo: "RDM. Toronto, 2009")

// A single node
let testNode = Node(id: 1,
                    paragraphs: [
                        "You are a deep sea explorer searching for the famed lost city of Atlantis. This is your most challenging and dangerous mission. Fear and excitement are now your companions.",
                        
                        "It is morning and the sun pushes up on the horizon. The sea is calm. You climb into the narrow pilot's compartment of the underwater vessel *Seeker* with your special gear. The crew of the research vessel *Maray* screws down the hatch clamps. Now begins the plunge into the depths of the ocean. The *Seeker* crew begins lowering by a strong, but thin, cable. Within minutes, you are so deep in the ocean that little light filters down to you. The silence is eerie as the *Seeker* slips deeper and deeper. You peer out the thick glass porthole and see strange white fish drifting past, sometimes stopping to look at you–an intruder from another world.",
                        
                    ],
                    image: "node-1",
                    edges: [
                        Edge(destinationId: 2,
                             prompt: "*Turn to the next page*")
                        ,
                    ],
                    ending: nil)

let emptyNode = Node(id: 0, paragraphs: [""], image: nil, edges: [], ending: Ending(classification: .good, description: "Lorem\\nipsum"))

// TODO: 5 - Replace the following list of nodes with your own group's nodes
// An array of nodes that model the narrative's directed graph
let storyNodes: [Int: Node] = [

    1 : Node(id: 1,
             paragraphs: [
                "You find yourself walking down the street after a night out with friends. Everything is as it should be, the weather is normal and the sounds of animals and critters alike are as they should be. The only thought on your mind is the start of your painful workday tomorrow at the London Museum.  On your way home, you hear a strange man calling out to you.  You wonder if he is actually real and continue to walk down the street.  You hear the strange man again, asking you to hear him out, saying that it would be worth your while.  Do you..."],
             image: "Node 1",
             edges: [
                Edge(destinationId: 2, prompt: "Hear out the strange man and his stories."),
                Edge(destinationId: 27, prompt: "Run away in fear."),
                Edge(destinationId: 28, prompt: "Pretend as if you don’t see him.")],
             ending: nil),
    2 : Node(id: 2,
             paragraphs: [
                "You walk over to the man and tell him to tell you about his stories.  He tells you of an old folk tale that you vaguely remember hearing before. You suddenly remember that your father used to tell you this story as a child.  When your father passed, you committed yourself to working at the London museum in his memory. The stories about the long-lost secrets and treasures of the London museum also influenced your decision to work at the museum. You hoped that by working there, you would be able to find closure on whether the stories were true or not.",
                "Up until this point, there has been no mention of any treasures or secrets at the museum.  The mysterious man tells you that part of this folk tale is true and that there is treasure hidden beneath the London museum.  This piques your curiosity.  He tells you to get into his van if you are interested in learning more.  Do you..."],
             image: "Node 2",
             edges: [
                Edge(destinationId: 3, prompt: "Get into his van."),
                Edge(destinationId: 26, prompt: "Begin to get suspicious and tell him you're not interested.")],
             ending: nil),
    3 : Node(id: 3,
             paragraphs: [
                "He takes you around the corner and opens the door to his van.  You step into the van and take a seat. The door closes behind you with a thud.  It's surprisingly comfortable – almost too comfortable. Before you can do anything, you begin to feel drowsy and slowly pass out in the seat. When you wake up, you are in what looks like your bedroom. Everything in this room is  identical to your room from before your father passed, when you were a child.",
                "The man from earlier opens the door and walks over to you.  He has something clenched in his hand.  He opens his hand and offers you two pills: a blue pill and a red pill. “Take the blue pill and you can leave. Take the red pill and the course of your life will be changed forever.  Choose carefully, once you choose a pill, there’s no changing your decision.” Before you choose a pill, you ask him what his name is, to which he replies “That is not important to our journey, if the time is ever right I may tell you… but until then there is no need to know.” Do you take the..."],
             image: "",
             edges: [
                Edge(destinationId: 4, prompt: "Blue Pill."),
                Edge(destinationId: 5, prompt: "Red Pill.")],
             ending: nil),
    4 : Node(id: 4,
             paragraphs: ["Grabbing the blue pill, you hesitantly swallow it.  A few seconds after swallowing the pill, your throat begins to close and you begin to suffocate.  As your mind becomes foggy and your vision begins to fade to black, you vaguely hear the man say, “I’m sorry, but there is no leaving once you’ve come this far. I can’t have any loose ends.  From the moment you stepped into the van, your life had already changed.  You just didn’t know it. The only way out of this is by walking through death’s door.”",
                 "The End."],
             image: "",
             edges: [],
             ending: Ending(classification: .death, description: "Dying after \\nblue pill.")),
    5 : Node(id: 5,
             paragraphs: ["Grabbing the red pill, you swallow it. As you swallow the pill, you brace yourself for something to happen.  Seconds pass and nothing changes.  As you begin to grow more paranoid, the man starts to speak, “This pill will have no effect on you. I just needed to ensure your commitment to our project.”"],
             image: "",
             edges: [
                Edge(destinationId: 6, prompt: "Continue listening.")],
             ending: nil),
    6 : Node(id: 6,
             paragraphs: ["“Now you may be wondering what exactly this project is. That’s not important.  All you need to know is that it’s a high risk, high reward course of action. We needed your connection to the London Museum to get the ball rolling. The London museum is just a front for the royal vault. This vault is an accumulation of all the gold and treasure acquired during the entirety of the British Empire.  It’s estimated to have a value of 10 billion pounds. All of that gold can be ours.   We just have to get into the vault. An ancient Monarch law states that the first one to enter the vault without royal ancestry shall be rewarded with all the possessions inside it. Seems simple enough right?”"],
             image: "",
             edges: [
                Edge(destinationId: 7, prompt: "Right.")],
             ending: nil),
    7 : Node(id: 7,
             paragraphs: [
                 "“Wrong!  You don’t just walk into the vault.  To enter it, you have to complete 3 puzzles. Making one mistake on any of the puzzles will have you end up just like your late father. Your father was actually the only person to complete the first puzzle.  You’ve been told that he died in a plane crash, but what you don’t know is that he died while attempting puzzle two. Hundreds of people have tried to reach the vault and your father was the closest one. Yet he didn’t come anywhere near entering the vault.  This is the second reason we need you. We believe that your father left you the key to the first puzzle. It’s the only key we don’t already know how to get.”",
                 "The only thing your father left you was a glass case with a rock. You agree to investigate it as you don’t really have another option. At home, you open the glass case and pick up the rock.  With the information from the strange man, you now notice that the rock feels lighter and seems hollow. You need to find a way to open it. Do you..."],
             image: "",
             edges: [
                Edge(destinationId: 8, prompt: "Try heating the rock to make it easier to break."),
                Edge(destinationId: 9, prompt: "Try freezing the rock before trying to crack it.")],
             ending: nil),
    8 : Node(id: 8,
             paragraphs: [
                "With the rock heated to a blazing hot temperature, you then go to break the rock. When the rock shatters, you begin to see liquid gold start dripping out of it. Dread fills you as you realize that you have melted the key. This one action has ruined the entire plan, locking the riches in the vault forever. Knowing the consequences of destroying the key, you flee the country in order to escape from the mysterious man.  You were never seen from or heard from again...",
                "The End."],
             image: "",
             edges: [],
             ending: Ending(classification: .death, description: "Melting the \\nfirst key.")),
    9 : Node(id: 9,
             paragraphs: ["Shattering the now frozen rock was an easy process. As it shatters, you hear the clang of metal on metal. There it is, the key to the first puzzle. Your father spent his entire life trying to attain this key. It was his most prized possession and the result of his life’s work. In the end, it brought him nothing. You wonder if you will meet the same fate as him.  Now with the key, you wonder if you should give it to the man for safe-keeping or keep it yourself.  Do you..."],
             image: "",
             edges: [
             Edge(destinationId: 10, prompt: "Choose to hold onto it until the heist begins."),
             Edge(destinationId: 11, prompt: "Choose to give it to the mysterious man for safekeeping.")],
             ending: nil),
    10 : Node(id: 10,
              paragraphs: ["Now that you’ve obtained the final piece needed for the heist, you must now decide on when to begin the heist.  You contact the man and tell him that you’ve obtained the key.  You also tell him that you will begin the heist tomorrow..."],
              image: "",
              edges: [
              Edge(destinationId: 12, prompt: "During the day."),
              Edge(destinationId: 13, prompt: "During the night.")],
              ending: nil),
    11 : Node(id: 11,
              paragraphs: ["You meet up with the man and hand him the key.  As the man grabs the key out of your hand, it dawns on you: you have just given up your only bargaining chip.  An expression of surprise fills your face as you feel a prick in your side.  Neurotoxins.  You see the man’s hand holding a needle that is now embedded in your torso.  As your breathing becomes increasingly harder, you vaguely hear the man tell you that “You are disposable.  Since you are no longer necessary for the project, you will now be disposed of.” As the man turns around and walks away, you fall to the ground and know no more.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .death, description: "Disposed of \\nafter giving key")),
    12 : Node(id: 12,
              paragraphs: ["Meeting up with the man near the museum, you both begin to walk towards it.  When you get to the building, the entrance is filled by a sea of people. You and the man look at each other and walk the other way.  You both agree to come back at night, when there will be less people around. You don’t want to arouse any suspicion, and coming back at night is the best way to do this. "],
              image: "",
              edges: [
              Edge(destinationId: 13, prompt: "Come back at night.")],
              ending: nil),
    13: Node(id: 13,
             paragraphs: ["As night falls, you head to the museum.  When you get there, the man is waiting for you. The first words that come out of his mouth are “Did you bring the key?” You give him a nod and tap the key hidden in your jacket pocket. The man turns around and heads into the museum and leads you to the basement, a part of the museum that you didn’t know existed.  As you continue walking down, every bone in your body tells you that this is a bad idea. It gets colder and you begin to get an eerie feeling.  The small staircase expands into a large spiral staircase that leads to an enormous room with the largest vault door you have ever seen.", "As you scan the room, you see that the corners of the rooms are covered in shadows, and that the only source of light is a small torch placed above what looks like a keyhole. Reaching the bottom of the staircase, the man walks over to the vault door and motions you over.  You understand what he’s asking and pull out your father’s key. You insert the key and turn it.  As you turn the key, a loud click resonates throughout the room and you hear humming and whirring from behind the door.  After a few minutes of these sounds, the door slowly opens, revealing the next puzzle."],
             image: "",
             edges: [
             Edge(destinationId: 14, prompt: "Walk through the door.")],
             ending: nil),
    14 : Node(id: 14,
              paragraphs: ["The door opens into a much smaller but well lit room. All the walls are made of dark grey steel. The roof is made of the same old cracked stone from the previous room.  Instead of torches like the previous room, this room has fluorescent lights mounted in rows on the ceiling.  The man follows you through the door and silently stops beside you"],
              image: "",
              edges: [
              Edge(destinationId: 15, prompt: "Continue searching the room.")],
              ending: nil),
    15 : Node(id: 15,
              paragraphs: ["As you continue searching the room, you find two differently shaped buttons on the opposite wall.  One button is bright blue and as small as a ping pong ball.  The other button is dark grey and is as large as a frisbee.  The mysterious man silently walks up behind you. He motions you towards the red button. You have gone too far to turn back now.  You wonder if you should believe the man or press the other button.  Do you think he’s trying to sabotage you so that he can continue alone?  So do you..."],
              image: "",
              edges: [
              Edge(destinationId: 16, prompt: "Press the other button."),
              Edge(destinationId: 17, prompt: "Press the button he motioned to.")],
              ending: nil),
    16 : Node(id: 16,
              paragraphs: ["As you press the dark grey button, the man sighs deeply and steps backwards.  Sometimes you have to have faith in people, no matter how untrustworthy they are.  You feel a small rumbling that starts to get stronger, before a loud crash fills your ears.  As you look up, a pebble falls on your head… followed by the rest of the roof. You are crushed beneath thousands of pounds of stone.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .death, description: "Building \\ncollapses")),
    17 : Node(id: 17,
              paragraphs: ["As you press the blue button, the sound of gears turning pierces your ears and the door behind you slams shut. You hear the audible click of the lock engaging.  The floor slowly opens up until you have nowhere left to stand and you fall into the pit below. Expecting a hard landing, you brace yourself for the pain, but end up landing on a big pile of mattresses. The floor under your mysterious partner has not fully opened yet, leaving you alone in this room for now.  Deciding to start looking around the room, you get off of the mattresses and look around."],
              image: "",
              edges: [
              Edge(destinationId: 18, prompt: "You start searching the room.")],
              ending: nil),
    18 : Node(id: 18,
              paragraphs: ["The room is much darker than even the first room, with the only light source coming from the lights above.  The walls are built of pure concrete and are slick to the touch.  While searching the final room you come across a hatch underneath the only mattress not in the pile that you fell on. Opening the hatch, the underside of the hatch reads “Leads to Museum Entrance”. It seems to lead out of the museum. Realizing that the man will not fall down here for a little bit, you understand that this is your best chance to escape this heist before the man decides to do anything to you.  Do you..."],
              image: "",
              edges: [
              Edge(destinationId: 19, prompt: "Go through the hatch and get out of the museum."),
              Edge(destinationId: 20, prompt: "Continue searching for the puzzle.")],
              ending: nil),
    19 : Node(id: 19,
              paragraphs: ["You quickly open the hatch and drop down into it. It’s a dark and damp tunnel that you have to bend forwards to walk.  You begin running through the tunnel, and after running for what seems like hours but was actually 15 minutes, you find yourself at a manhole. As you pop the manhole and pull yourself out, you see that you’re back on the streets in front of the museum. ", "After getting out of the hole, you come to the realization that the man will be looking for you. You flee the country in hopes of being able to live out your life without fear of capture by the mysterious man that is very likely going to search you out. You end up living a normal and utterly boring life.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .ok, description: "Get cold feet \\nand flee")),
    20 : Node(id: 20,
              paragraphs: ["You find the puzzle hidden in one of the dark corners in the room. As you start to make it out, you see that it is a combination of a board of switches next to a large red button. Above the board of switches is a picture of Boris Johnson and the large red button has a picture of the Queen above it.  As you wonder what the puzzle could be telling you, you hear a crash behind you. You look behind you to see the mysterious man roll off of the mattresses.  He walks over to you and proceeds to look at you.  It’s like he’s pressuring you to choose a button.  Do you..."],
              image: "",
              edges: [
              Edge(destinationId: 21, prompt: "Choose Boris."),
              Edge(destinationId: 22, prompt: "Choose the Queen.")],
              ending: nil),
    21 : Node(id: 21,
              paragraphs: ["You choose Boris’ buttons in hopes that the UK Prime Minister will show you the way. Immediately after the last button is pressed, the painting falls off the wall to reveal a hole in the wall with a large spike pointing at you. As the painting hits the floor, the spike shoots out of the wall, piercing you through the chest. You collapse on the ground and bleed out within seconds.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .death, description: "Death by \\ntrap")),
    22 : Node(id: 22,
              paragraphs: ["Normally, a big red button doesn’t seem like the best thing to press.  In this case though, you have clearly remembered that this is the royal family’s treasure and sadly not Boris Johnson’s. When the button is pressed, the ground begins to shake and the wall that the puzzle was mounted on begins to move. It slides backwards before moving to the side, revealing a large vault door.  This door slowly opens outwards, revealing yet another room with a larger vault door at the end of it.  You completely forget about the man and walk through the door."],
              image: "",
              edges: [
              Edge(destinationId: 23, prompt: "Continue into the next room.")],
              ending: nil),
    23 : Node(id: 23,
              paragraphs: ["Without taking the time to look around the room, you start walking towards the next vault door.  Out of the corner of your eye, you see the mysterious man eye you eerily. You feel like he has something planned for you in this room.  Slowly down, you look around the room.  It’s brightly lit, with nothing in the room except a narrow walkway leading towards the vault door.  On both sides of the walkway, there are deep pits that you can’t see the bottom of.", "It hits you that the man is likely thinking of pushing you off the walkway at the last hurdle, so that he has the riches to himself.  Now you wonder if you should betray him and push him off the edge or not…  Maybe you’re being paranoid, maybe you’re not. Do you"],
              image: "",
              edges: [
              Edge(destinationId: 24, prompt: "Don't betray him."),
              Edge(destinationId: 25, prompt: "Betray the unnamed man.")],
              ending: nil),
    24 : Node(id: 24,
              paragraphs: ["Deciding not to betray the mysterious man, you walk ahead of him towards the vault door.  However, this time, it looks like your gut instinct was right. You hear the footsteps of the man getting closer to you before you feel a shove in the small of your back. You can’t do anything but watch as your body tumbles off the edge.   You fall for what seems like an eternity until… nothing. You are dead.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .death, description: "Get \\nbetrayed")),
    25 : Node(id: 25,
              paragraphs: ["Deciding to push him off when the time is right, you start waiting for the best opportunity. As the man starts looking around, he begins to walk towards the edge of the walkway.  Deciding you’ll never get a better opportunity, you sprint at him.  He clearly hears your footsteps and turns around.  You see his eyes widen in fear as your hands connect with his chest and send him sprawling off the walkway into the pit.", "As the mysterious man disappears, a loud scream echoes against the wall until it abruptly cuts off with a dull thud. You start walking towards the vault door.  As you get closer, the door begins to open silently.  On the inside of the door, you see the riches of the royal vault. You have won. You walk into the vault and see the mountains of gold and treasure that is now all yours.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .best, description: "Get all \\nthe riches")),
    26 : Node(id: 26,
              paragraphs: ["The offer he gives you of getting into his van seems too sketchy.  You feel like there’s too much that could go wrong and decide to decline his offer.  He merely shrugs his shoulders and tells you that you might not ever get this opportunity again.   Your mind is made up, and it looks like he accepts that.  He walks down the alley and you go back on your way home.  After mulling over this strange encounter as you walk, you realize you’re at home."],
              image: "",
              edges: [
              Edge(destinationId: 33, prompt: "Walk into your house.")],
              ending: nil),
    27 : Node(id: 27,
              paragraphs: ["Deciding that this encounter has too many ways to go wrong, you decide to run down the street away from the mysterious man.  You see him get up and start to give chase.  You’re panicked and wonder if the man is following you at all.  You keep glancing back as you sprint blocks down the road from where the man was.  You continue to run and your breathing continues to get faster as you progressively get more tired."],
              image: "",
              edges: [
                Edge(destinationId: 29, prompt: "Get off the road to find other places to run.")],
              ending: nil),
    28 : Node(id: 28,
              paragraphs: ["Pretending to not hear the man, you continue on your way down the street.  He doesn’t yell out again, and you look back to see him get up and walk into an alley nearby.  You think nothing of it at the time, you walk back to your house."],
              image: "",
              edges: [
              Edge(destinationId: 30, prompt: "Continue walking back home.")],
              ending: nil),
    29 : Node(id: 29,
              paragraphs: ["Deciding to get off of this road, you start running through backyards, parking lots and parks.  Even after running through these places, you still don’t think that the man has stopped chasing you.  Looking up ahead, you see a large highway.  You think that you would definitely lose him if you crossed the highway.  Getting onto the highway, you start running across.  However, instead of losing the man at the other end of the highway, you end up losing your life because of the large tanker truck that hit you in your craze.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .death, description: "Run over \\nby a car")),
    30 : Node(id: 30,
              paragraphs: ["Once you reach your house, you go inside and go about your nightly routine.  For some reason you can’t get the strange man out of your mind. He is in your head and you can’t do anything about it. It’s driving you crazy. You wonder why he asked only you to listen to his story before getting up and leaving his spot.  What does he want? Do you..."],
              image: "",
              edges: [
              Edge(destinationId: 31, prompt: "Decide to go back and look for him."),
              Edge(destinationId: 32, prompt: "Try to ignore the man and your wild imagination.")],
              ending: nil),
    31 : Node(id: 31,
              paragraphs: ["You decide to go back and hear the man out.  When you’re on your way home the next day, you take the same path as you did yesterday, hoping to find the man on your way.  Lucky for you, it seems like he’s waiting for you as well.   He asks you if you want to listen to his stories, and you nod.  He tells you about a folk tale of the London museum and how there is a vault underneath it with mountains of treasure.  You realize that this is similar to the stories your father told you as a child. Now you’re interested.  After the man explains the London museum, he tells you to follow him around the corner.  You do as he tells you."],
              image: "",
              edges: [
              Edge(destinationId: 3, prompt: "Follow him around the corner.")],
              ending: nil),
    32 : Node(id: 32,
              paragraphs: ["You decide to ignore him and whatever weird things he’s doing. However, all this does to you is make your already wild imagination ever wilder.  Your mind keeps replaying and adding new scenarios that the man could’ve been doing.  It culminates in your mind getting overwhelmed by the possibilities and you develop schizophrenia.  You spend the rest of your days locked inside a mental asylum.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .bad, description: "Live in \\nmental asylum")),
    33 : Node(id: 33,
              paragraphs: ["As you walk in your house, you wonder why the man’s offer reminds you of the stories your father used to tell you. The stories of the wonders of the London museum.  You start to wonder if your father may have been involved in attempting to find the riches of the museum.  You know that your father had a secret office hidden in the floor of his study since you stumbled upon it a few years ago.", "You have never entered it, but you’ve known about its existence for years.  You wonder if you should go into this office and look around for any information about his time at the London museum.  Or, you think that you might discover something that changes your life forever and you don’t know if you want to commit to this path."],
              image: "",
              edges: [
              Edge(destinationId: 34, prompt: "Don't enter his office."),
              Edge(destinationId: 35, prompt: "Look into his secret office.")],
              ending: nil),
    34 : Node(id: 34,
              paragraphs: ["You ignore it and your life continues as normal.  Nothing fun happens and you just continue your regular, boring everyday life as a London museum worker.  There’s nothing in your life that catches your interest anymore and you live a completely normal and average life.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .ok, description: "Ignore \\neverything")),
    35 : Node(id: 35,
              paragraphs: ["You decide to look into his secret office.  You walk into your dad’s study and pull the lever hidden underneath the book hidden in a corner.  The ground rumbles slightly as the stairway down appears from the ground.  You walk down into his secret office.  You begin looking around for anything that you think might lead to a connection with the man.  You search everywhere in the room and find nothing.  In your frustration, you sit on his desk.  As you do so, you hear the click of a hidden compartment door popping open.  It’s on the top of the desk and was flush with the actual desk.  Popping it open, you find files and diagrams that changes everything you know about your dad."],
              image: "",
              edges: [
              Edge(destinationId: 36, prompt: "Read your father's files.")],
              ending: nil),
    36 : Node(id: 36,
              paragraphs: ["The files you found in his secret office are all of your father’s life work. Your father had spent his whole life trying to find a way to the treasure that the mysterious man is now trying to find as well. This new information starts to inspire you to finish your father’s work and find the treasure. However, you don’t know how you’re going to do this.  You know that there’s a man searching for the treasure.  You don’t know if you can trust him to work with you.  You wonder if you should find this man and work together or try and find a way to do this all yourself.  Do you..."],
              image: "",
              edges: [
              Edge(destinationId: 37, prompt: "Try and find the man to take part in his plan."),
              Edge(destinationId: 38, prompt: "Attempt to make your own plan.")
              ],
              ending: nil),
    37 : Node(id: 37,
              paragraphs: ["You start looking for the man and realize the best place to find him would be where you left him. You go back and sure enough there he is.  You tell him that you want to get into his van to learn more about the London museum vault.  He looks at you strangely and asks you if this is what you really want to do.  You say that this is, so he stands up and tells you to follow him."],
              image: "",
              edges: [
              Edge(destinationId: 3, prompt: "Follow him to where he's taking you.")],
              ending: nil),
    38 : Node(id: 38,
              paragraphs: ["You begin to devise your own plan using your father’s knowledge.  You learn that there are three puzzles that hide the treasure, and after many hours of combing over your father’s files and taking trips to the first puzzle yourself, you have developed a plan to open all three puzzles and get the treasure.  Now all you’re hoping for is that your plan actually works."],
              image: "",
              edges: [
              Edge(destinationId: 39, prompt: "Put your plan into motion.")],
              ending: nil),
    39 : Node(id: 39,
              paragraphs: ["Sure enough your plan works and you find yourself past the third puzzle door when you hear someone else’s footsteps behind you.  You turn around and see the mysterious man walking up to you. You can feel his ill intention and since you know he wants to do something bad to you, decide to not give him any gold at all costs.  On you, you have a sword and a gun.  You can use either to ensure that he doesn’t cut you off at the last hurdle and steal all of the treasure.. Do you"],
              image: "",
              edges: [
              Edge(destinationId: 40, prompt: "Try to shoot him."),
              Edge(destinationId: 41, prompt: "Challenge him to a sword duel for the gold.")],
              ending: nil),
    40 : Node(id: 40,
              paragraphs: ["Deciding that using the gun is your best bet, you pull it out and aim it at the man before firing.  However, you overestimated your absolutely horrendous abilities with firearms and instead of hitting the man in front of you, you managed to hit a chain connected to the roof.  As the chain snaps, you see the roof begin to crack and fall apart.  The entire ceiling and the entire museum along with it fall on your head, killing you and hiding the treasure forever.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .death, description: "A roof falling \\non your head")),
    41 : Node(id: 41,
              paragraphs: ["Knowing that your proficiency with firearms is at best a joke, you pull out your sword and challenge the man to a duel with the stakes being the other person’s life and full possession of the treasure.  The man accepts your proposal and draws his own sword.  You wonder if you’ve just made a sword fighting proposal to a proficient sword fighter and hope that you are skilled enough to defeat him.  You count down from three and start the duel."],
              image: "",
              edges: [
              Edge(destinationId: 42, prompt: "Start sword fighting the man.")],
              ending: nil),
    42 : Node(id: 42,
              paragraphs: ["Once the duel commences, it appears that you are apparently a master fencer and easily outclass and stab the man.  With victory secured and the man felled, you think that you’re on your way to owning all the treasure in the vault.  As you watch the man slowly die, he looks at you in his dying moments and tells you that he is actually your father. You are completely shocked by this revelation. You get all the gold in the vault and live a wealthy life, but develop PTSD and many other mental illnesses because of the knowledge that you killed your father in pursuit of treasure.", "The End."],
              image: "",
              edges: [],
              ending: Ending(classification: .good, description: "You get the \\n gold but also PTSD")),
]



// Function to generate output that Graphviz requires
func generateGraphvizCommands(using description: StoryInformation, with nodes: [Int : Node]) -> String {
    
    // Opening of graph
    var output = "digraph \"[map]\" {\n"

    // Start subgraph which contains table that comprises title section
    output += "subgraph { \"title\" [shape=none label=<<table border=\"0\">\n"
    output += "  <tr>\n"
    output += "    <td align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"40\"><b>\(description.title)</b></font></td>\n"
    output += "    <td width=\"100\"></td>\n"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "    <td align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"20\">By \(description.authorOrAuthors)</font></td>\n"
    output += "    <td></td>"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "    <td>&nbsp;</td>\n"
    output += "    <td></td>"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "    <td align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"16\">\(description.seriesInfo)</font></td>\n"
    output += "    <td></td>"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "    <td align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"16\">\(description.publisherInfo)</font></td>\n"
    output += "    <td></td>"
    output += "  </tr>\n"

    // End the table that comprises title section
    output += "</table>>]\n"
    output += "}\n"

    // Make empty dictionary to track endings
    var endingsCount = [String : Int]()

    // Build the graph itself from a sorted list of the nodes
    for (key, node) in nodes.sorted(by: { lhs, rhs in lhs.key < rhs.key }) {
        
        // Handle ending nodes
        if let ending = node.ending {
            
            // Make ending nodes show up in red
            output += "\(key) [style=\"filled\", fillcolor=\"\(ending.color)\"]\n"
            
            // Create an invisible node after each ending node
            output += "\"\(ending.description) \(node.id)\" [style=invis]\n"
            
            // Make a label after the ending node
            output += "\(key) -> \"\(ending.description) \(node.id)\" [labelangle=0, minlen=3,  color=white, taillabel=\"\\n\(ending.description)\", fontname=\"Helvetica Bold\"]\n"
            
            // Track endings by category
            if let valueForKey = endingsCount[ending.classification.rawValue] {
                // Increment count of endings of this type
                endingsCount[ending.classification.rawValue]! = valueForKey + 1
            } else {
                // Start count of endings of this type
                endingsCount[ending.classification.rawValue] = 1
            }
        }
            
        // Draw nodes and edges between nodes
        output += "\(key) -> {"
        for edge in node.edges {
            output += "\(edge.destinationId);"
        }
        output += "} [minlen=2]\n"
    }

    // Start subgraph which endings analysis
    output += "subgraph { \"endings\" [shape=none label=<<table border=\"0\">\n"
    output += "  <tr>\n"
    output += "  <td width=\"100\"></td>\n"
    output += "    <td colspan=\"2\" align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"20\"><b>&nbsp;</b></font></td>\n"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "  <td></td>\n"
    output += "    <td colspan=\"2\" align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"20\"><b>&nbsp;</b></font></td>\n"
    output += "  </tr>\n"
    output += "  <tr>\n"
    output += "  <td></td>\n"
    output += "    <td colspan=\"2\" align=\"left\"><font face=\"Verdana,Helvetica\" point-size=\"20\"><b>Analysis of endings</b></font></td>\n"
    output += "  </tr>\n"

    // Make placeholders for counts of ending types
    for enumerationCase in EndingClassification.allCases {
        
        // Get count of endings for this ending type
        var countForThisEndingType = 0
        if let count = endingsCount[enumerationCase.rawValue] {
            countForThisEndingType = count
        }
        
        output += "  <tr>\n"
        output += "  <td></td>\n"
        output += "<td align=\"right\" valign=\"top\"><font face=\"Verdana,Helvetica\" point-size=\"16\">\(countForThisEndingType)</font></td>"
        output += "    <td align=\"left\" valign=\"bottom\"><font face=\"Verdana,Helvetica\" point-size=\"18\" color=\"\(Ending.init(classification: enumerationCase, description: "").color)\"><b>\(enumerationCase.rawValue)</b></font></td>\n"
        output += "  </tr>\n"
    }

    // End the table that comprises title section
    output += "</table>>]\n"
    output += "}\n"

    // Close out the graph
    output += "}\n"
    
    return output
    
}

let graphVizCommands = generateGraphvizCommands(using: storyInfo,
                                                with: storyNodes)

// Copy to the clipboard
let pasteBoard = NSPasteboard.general
pasteBoard.clearContents()
pasteBoard.setString(graphVizCommands, forType: .string)

// TODO: 6 - Paste the output from this program into a BBEdit text document named 'input.txt'.

// TODO: 7 - If you have not yet, install Homebrew.
//
//       https://brew.sh

// TODO: 8 - If you have not yet, install graphviz by running this command in the Terminal
//
//       brew install graphviz

// TODO: 9 - In the Terminal, from the folder 'input.txt' exists in, run the following command to generate your group's graph:
//
//           dot -Tpdf input.txt > output.pdf
