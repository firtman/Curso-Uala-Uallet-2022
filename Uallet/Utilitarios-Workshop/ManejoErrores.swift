import Foundation

enum ErrorDistancia: Error {
    case Punto1Negativo, Punto2Negativo
}




func distancia(_ punto1: Int, _ punto2: Int) throws -> Int {
    
    guard punto1 >= 0 else {
        throw ErrorDistancia.Punto1Negativo
    }
    
    guard punto2 >= 0 else {
        throw ErrorDistancia.Punto2Negativo
    }
            
    return punto2-punto1
}


func prueba() {
    var x : Int = 0 // = try? distancia(2, 3)
    
    do {
        x = try distancia(3, 4)
        print(x)
    } catch (ErrorDistancia.Punto1Negativo) {
        print("El punto 1 es nulo")
    } catch (ErrorDistancia.Punto2Negativo) {
        print("El punto 2 es nulo")
    } catch {
        print("Hubo un error")
    }
    
}
