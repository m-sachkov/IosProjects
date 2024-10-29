import Cocoa

class Second {
    var test: String = ""
    
    init(test: String) {
        self.test = test
    }
}

struct First {
    var test: String
}



actor ServerConnection {
    var server: String = "primary"
    private var activeUsers: [Int] = []
    
    private func fetchUserID(from: String) async -> Int {
        return 1
    }
    
    func connect() async -> Int {
        let userID = await fetchUserID(from: server)
        // ... communicate with server ...
        activeUsers.append(userID)
        return userID
    }
}

Task {
    let server1 = ServerConnection()
    print(await server1.server)
}
print("Second")


protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}

class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
    func adjust() {
        <#code#>
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription


struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
