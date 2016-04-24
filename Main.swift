protocol Displayable {
    func display()
}

enum Element {
    case
    Axiom(nb:Int, book:Int),
    Proposal(nb:Int, book:Int),
    Demonstration(nb:Int, book:Int)
}

extension Element: CustomStringConvertible  {
    var description: String {
        switch self {
            case .Axiom(let nb, let book):
                return "A" + String(book) + "," + String(nb)  
            case .Proposal(let nb, let book):
                return "P" + String(book) + "," + String(nb)
            case .Demonstration(let nb, let book):
                return "D" + String(book) + "," + String(nb) 
        }
    }
}

extension Element: Hashable {
    var hashValue: Int {
         get {
             switch self {
                case .Axiom(let nb, let book):
                    return 11 * nb.hashValue * book.hashValue
                case .Proposal(let nb, let book):
                    return 12 * nb.hashValue * book.hashValue
                case .Demonstration(let nb, let book):
                    return 13 * nb.hashValue * book.hashValue
             }
         } 
     }
}

extension Element: Displayable {
    func display() {
        print(self, terminator:"")
    }
}

func ==(lhs:Element, rhs:Element) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

func displayDependencies<T:Displayable>(element:T, graph:Dictionary<T, [T]>, iterationLevel:Int) {
    
    // Search for the element in the map
    let dependencies = graph[element]
    
    if dependencies == nil {
        return
    }
    
    // Display all the dependencies (and continue recursively)
    for (index, e) in dependencies!.enumerate() {
        // Display spaces according the iterationLevel
        if (iterationLevel > 0) {
            for _ in 0...(iterationLevel - 1) {
            print(" ", terminator:"")
            }
        }
        
        print("+-- ", terminator:"")
        
        // Display the current element
        e.display()
        
        if (graph[e] != nil) {
            print("\n", terminator:"")
        }
        
        // Display its child recursively
        displayDependencies(e, graph:graph, iterationLevel:iterationLevel + 1)
        
        if (index != dependencies!.count - 1) {
            print("\n", terminator:"")
        }
    } 
}

func displayAll<T:Displayable>(proposals:[T], graph:Dictionary<T, [T]>) {
    for p in proposals {
        print("\n\nDemonstration de : ", terminator:"")
        print(p)
        print("")
        
        displayDependencies(p, graph:graph, iterationLevel:0)
    }
}

// The Spinoza datas

let a1 = Element.Axiom(nb:1, book:1)
let a2 = Element.Axiom(nb:2, book:1)
let a3 = Element.Axiom(nb:3, book:1)
let a4 = Element.Axiom(nb:4, book:1)
let a5 = Element.Axiom(nb:5, book:1)
let a6 = Element.Axiom(nb:6, book:1)
let a7 = Element.Axiom(nb:7, book:1)

let p1 = Element.Proposal(nb:1, book:1)
let p2 = Element.Proposal(nb:2, book:1)
let p3 = Element.Proposal(nb:3, book:1)
let p4 = Element.Proposal(nb:4, book:1)
let p5 = Element.Proposal(nb:5, book:1)
let p6 = Element.Proposal(nb:6, book:1)
let p7 = Element.Proposal(nb:7, book:1)
let p8 = Element.Proposal(nb:8, book:1)
let p9 = Element.Proposal(nb:9, book:1)
let p10 = Element.Proposal(nb:10, book:1)
let p11 = Element.Proposal(nb:11, book:1)
let p12 = Element.Proposal(nb:12, book:1)
let p13 = Element.Proposal(nb:13, book:1)
let p14 = Element.Proposal(nb:14, book:1)
let p15 = Element.Proposal(nb:15, book:1)
let p16 = Element.Proposal(nb:16, book:1)
let p17 = Element.Proposal(nb:17, book:1)
let p18 = Element.Proposal(nb:18, book:1)
let p19 = Element.Proposal(nb:19, book:1)
let p20 = Element.Proposal(nb:20, book:1)
let p21 = Element.Proposal(nb:21, book:1)
let p22 = Element.Proposal(nb:22, book:1)
let p23 = Element.Proposal(nb:23, book:1)
let p24 = Element.Proposal(nb:24, book:1)
let p25 = Element.Proposal(nb:25, book:1)
let p26 = Element.Proposal(nb:26, book:1)
let p27 = Element.Proposal(nb:27, book:1)
let p28 = Element.Proposal(nb:28, book:1)
let p29 = Element.Proposal(nb:29, book:1)
let p30 = Element.Proposal(nb:30, book:1)
let p31 = Element.Proposal(nb:31, book:1)
let p32 = Element.Proposal(nb:32, book:1)
let p33 = Element.Proposal(nb:33, book:1)
let p34 = Element.Proposal(nb:34, book:1)
let p35 = Element.Proposal(nb:35, book:1)
let p36 = Element.Proposal(nb:36, book:1)

let d1 = Element.Demonstration(nb:1, book:1)
let d2 = Element.Demonstration(nb:2, book:1)
let d3 = Element.Demonstration(nb:3, book:1)
let d4 = Element.Demonstration(nb:4, book:1)
let d5 = Element.Demonstration(nb:5, book:1)
let d6 = Element.Demonstration(nb:6, book:1)
let d7 = Element.Demonstration(nb:7, book:1)
let d8 = Element.Demonstration(nb:8, book:1)

let proposals = [p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, p33, p34, p35, p36]

var graph = Dictionary<Element, [Element]>()

graph[p1] = [d3, d5]
graph[p2] = [d3]
graph[p3] = [a4, a5]
graph[p4] = [d3, d4, d5, a1]
graph[p5] = [d3, a6, p1, p4]
graph[p6] = [d3, d5, a1, a4, p2, p3, p5]
graph[p7] = [d1, p6]
graph[p8] = [d2, p5, p7]
graph[p9] = [d4]
graph[p10] = [d3, d4, d6]
graph[p11] = [d6, a1, a7, p2, p6, p7]
graph[p12] = [d4, p2, p5, p6, p7, p8, p10]
graph[p13] = [p5, p8, p11, p12]
graph[p14] = [d6, a1, p5, p10, p11]
graph[p15] = [d3, d5, a1, p5, p6, p8, p12, p13, p14]
graph[p16] = [d6]
graph[p17] = [d7, p11, p14, p15, p16]
graph[p18] = [d3, p14, p15, p16]
graph[p19] = [d4, d6, d8, p7, p11]
graph[p20] = [d4, d8, p19]
graph[p21] = [d2, p11, p20]
graph[p22] = [d2, p11, p20]
graph[p23] = [d5, d6, d8, p15, p19, p21, p22]
graph[p24] = [d1, p14]
graph[p25] = [d5, a4, p15, p16]
graph[p26] = [p16, p25]
graph[p27] = [a3]
graph[p28] = [d3, d5, a1, p15, p21, p22, p24, p25, p26]
graph[p29] = [p11, p14, p15, p16, p17, p21, p24, p26, p27, p28]
graph[p30] = [a6, p14, p15]
graph[p31] = [d5, d6, p15, p29]
graph[p32] = [d7, p23, p28, p29]
graph[p33] = [d7, p11, p14, p16, p17, p29]
graph[p34] = [p11, p16]
graph[p35] = [p34]
graph[p36] = [p16, p25, p34]

// Execute the program

displayAll(proposals, graph:graph)

print("")