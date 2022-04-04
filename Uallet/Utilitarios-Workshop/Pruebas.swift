import Foundation


typealias Entero = Int

var v1 = 1
let v2 = 2

func f() {
    
}

class Customer {
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    var id: Int
    var name: String
    var description: String?

}

class Y {
    
}

struct Product {
    var id: Int
    var name: String
    var price: Double
}

struct B {
    var x = 2
}


func agregarDescripcion( _ c: Customer)  {
    c.description = "\(c.name). ID=\(c.id)"
}

func pruebaStructs() {
    
//    var product1 = Product(id: 2, name: "Coca Cola", price: 100)
//
//    var customer1 = Customer(id: 3, name: "A") // descripcion = nil
//    agregarDescripcion(customer1)
//    print(customer1.description ?? "sin descripcion") // descripcion = nil o "A. ID=3"
//
}

protocol P {
    
}

enum E {
    
}




