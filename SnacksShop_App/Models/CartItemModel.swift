import Foundation

struct CartItemModel: Identifiable {
  let id = UUID()
  let product: ProductModel
  var quantity: Int
}
