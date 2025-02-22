import Foundation

struct CartItem: Identifiable {
  let id = UUID()
  let product: ProductModel
  var quantity: Int
}
