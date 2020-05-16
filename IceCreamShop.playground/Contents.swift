struct Flavor {
    let name: String
    let rating: Double
}

enum Size: Double {
    case small = 2.99
    case medium = 3.99
    case large = 4.99
}

enum Topping: String {
    case nuts = "chopped nuts"
    case hotFudge = "hot fudge"
    case strawberry = "strawberry syrup"
    case whippedCream = "whipped cream"
    case butterscotch = "butterscotch syrup"
    case sprinkles = "sprinkles"
}

struct Cone {
    let flavor: Flavor
    let topping: Topping?
    let size: Size
    
    func eat() {
        print("Mmm! I love \(self.flavor.name)!")
    }
}

class IceCreamShop {
    var flavors: [Flavor]
    var toppings: [Topping]
    var sizes: [Size]
    var totalSales: Double
    
    init(flavors: [Flavor], toppings: [Topping], sizes: [Size]) {
        self.flavors = flavors
        self.toppings = toppings
        self.sizes = sizes
        self.totalSales = 0
    }
    
    func listTopFlavors() {
        print("Our top flavors are:")
        for flavor in flavors {
            if flavor.rating > 4 {
                print("\(flavor.name)")
            }
        }
    }
    
    func orderCone(flavor: Flavor, topping: Topping?, size: Size) -> Cone? {
            let orderedCone = Cone(flavor: flavor, topping: topping, size: size)
        totalSales += size.rawValue
        if let orderedTopping = orderedCone.topping?.rawValue {
            print("Your \(orderedCone.flavor.name) ice cream with \(orderedTopping) is $\(orderedCone.size.rawValue).")
        } else {
            print("Your \(orderedCone.flavor.name) ice cream is $\(orderedCone.size.rawValue).")
        }
        return orderedCone
    }
}

var mySizes = [Size.small, Size.medium, Size.large]

let chocolate = Flavor(name: "chocolate", rating: 4.3)
let strawberry = Flavor(name: "strawberry", rating: 4.2)
let vanilla = Flavor(name: "vanilla", rating: 3.4)
let mango = Flavor(name: "mango", rating: 4.9)
let rockyRoad = Flavor(name: "rocky road", rating: 3.0)
let butterPecan = Flavor(name: "butter pecan", rating: 2.3)

var myFlavors = [chocolate, strawberry, vanilla, mango, rockyRoad, butterPecan]

var myToppings = [Topping.nuts, Topping.hotFudge, Topping.strawberry, Topping.whippedCream, Topping.butterscotch, Topping.sprinkles]

var myShop = IceCreamShop(flavors: myFlavors, toppings: myToppings, sizes: mySizes)


myShop.listTopFlavors()

myShop.orderCone(flavor: mango, topping: Topping.hotFudge, size: Size.small)

let myCone = myShop.orderCone(flavor: chocolate, topping: nil, size: Size.medium)

myCone?.eat()

print(myShop.totalSales)










