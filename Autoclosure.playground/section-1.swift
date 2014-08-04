// Playground - @auto_closure

import UIKit

// una stringa qualsiasi
let text = "Ciao"

// funzione che accetta una closure come parametro
func printWithPrefix(text: String,  getPrefix: () -> String ) {
    
    let prefix = getPrefix()
    println(prefix + text)
    
}

// chiamate
printWithPrefix(text, {() -> String in return "PRE"})
printWithPrefix(text, {return "PRE"})
printWithPrefix(text, {"PRE"})
printWithPrefix(text, {

        if text.isEmpty {
            return ""
        } else {
            return "NAME: "
        }
    }
)

// stessa ma con auto_closure
func printWithPrefix2(text: String,  getPrefix:@auto_closure () -> String ) {

    let prefix = getPrefix()
    println(prefix + text)
}

// chiamate
printWithPrefix2(text, "PRE")
let myClosure = {() -> String in
    
    if text.isEmpty {
        return ""
    } else {
        return "NAME: "
    }
}
printWithPrefix2(text, myClosure())

// errore
// printWithPrefix2(text, {"PRE"})


