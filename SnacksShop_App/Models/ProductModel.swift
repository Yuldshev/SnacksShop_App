import SwiftUI

struct Product: Identifiable {
  let id = UUID()
  let name: String
  let image: String
  let category: ProductCategory
  let color: Color
  let price: Int
}

let productList: [Product] = [
  Product(name: "Good Source", image: "goodSource", category: .choco, color: .sBlushPink, price: 8),
  Product(name: "Unreal Muffins", image: "unrealMuffins", category: .choco, color: .sLimeMist, price: 5),
  Product(name: "Perfect Snacks", image: "perfectSnacks", category: .choco, color: .sLavenderHaze, price: 8),
  Product(name: "Smiths Chips", image: "smithsChips", category: .chips, color: .sPeachCream, price: 7),
  Product(name: "Coconut Chips", image: "coconutChips", category: .chips, color: .sMintWhisper, price: 6),
  Product(name: "Dark Russet", image: "darkRusset", category: .chips, color: .sAlmondBeige, price: 8),
  Product(name: "Twister Chips", image: "twisterChips", category: .chips, color: .sCoralBlush, price: 6),
  Product(name: "Deep River", image: "deepRiver", category: .chips, color: .sSoftLilac, price: 9),
  Product(name: "Regular Nature", image: "regularNature", category: .chips, color: .sPeriwinkleGlow, price: 7)
]
  
