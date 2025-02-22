import SwiftUI

struct ProductModel: Identifiable, Hashable {
  let id = UUID()
  let name: String
  let category: Category
  let image: String
  let price: Double
  let color: Color
  let description: String
}

let productList: [ProductModel] = [
  //MARK: - Category Choco
  ProductModel(name: "Good Source", category: .choco, image: "goodSource", price: 8, color: .cPink, description: "A snack designed to recharge your energy in the afternoon, featuring ingredients like dried apples, walnuts, and cayenne pepper to provide balanced nutrition and a boost of vitality."),
  ProductModel(name: "Perfect Snacks", category: .choco, image: "perfectSnacks", price: 6, color: .cLavanda1, description: "An organic dark chocolate bar made from natural ingredients, rich in protein and healthy fats, making it an ideal choice for a nutritious snack."),
  ProductModel(name: "Unreal Muffins", category: .choco, image: "unrealMuffins", price: 5, color: .cGreen1, description: "Chocolate bars crafted from three simple ingredients: organic coconut, Fair Trade dark chocolate, and organic cassava syrup. Free from artificial additives, gluten, and dairy."),
  
  //MARK: - Category Chips
  ProductModel(name: "Smiths Chips", category: .chips, image: "smithsChips", price: 7, color: .cOrange, description: "Ridge-cut potato chips with a rich barbecue flavor, made from natural ingredients, perfect for those who enjoy savory snacks."),
  ProductModel(name: "Dark Russet", category: .chips, image: "darkRusset", price: 8, color: .cBrown, description: "Potato chips made from dark Russet potatoes, offering a deep, rich flavor and a crunchy texture."),
  ProductModel(name: "Regular Nature", category: .chips, image: "regularNature", price: 6, color: .cBlue, description: "Classic ridged potato chips with a traditional salty taste, known for their crispy texture and natural composition."),
  ProductModel(name: "Deep River", category: .chips, image: "deepRiver", price: 7, color: .cLavanda2, description: "Potato chips flavored with sweet Maui onion, made from natural ingredients, free from gluten and artificial additives."),
  ProductModel(name: "Twister Chips", category: .chips, image: "twisterChips", price: 9, color: .cRed, description: "Crispy snacks with an intense tomato and paprika flavor, perfect on their own or paired with various dips."),
  ProductModel(name: "Coconut Chips", category: .chips, image: "coconutChips", price: 6, color: .cGreen2, description: "Natural coconut chips, lightly sweetened and toasted to a crispy texture, providing a good source of healthy fats and fiber."),
  
  //MARK: - Category Candy
  ProductModel(name: "Haribo Goldbears", category: .candy, image: "hariboGoldbears", price: 3, color: .cOrange, description: "Classic gummy bears with fruity flavors, beloved for their chewy texture and variety of tastes."),
  ProductModel(name: "Skittles Lime", category: .candy, image: "skittlesLime", price: 4, color: .cGreen2, description: "Vibrant candies with a tangy-sweet fruit taste, offering an explosion of flavor in a rainbow of colors."),
  ProductModel(name: "Baskin Robbins", category: .candy, image: "baskinRobbins", price: 7, color: .cBrown, description: "Confections inspired by popular Baskin Robbins ice cream flavors, offering a variety of tastes in a convenient form for sweet lovers.")
]
