import SwiftUI

@Observable
class CardManager {
  var products: [Product] = []
  var total = 0
  
  func addToCard(_ product: Product) {
    products.append(product)
    total += product.price
  }
  
  func removeFromCard(_ product: Product) {
    products = products.filter { $0.id != product.id }
    total -= product.price
  }
}
