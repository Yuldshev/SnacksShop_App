import Foundation
import SwiftUI

class CartManager: ObservableObject {
  @Published var items: [CartItem] = []
  
  func addToCart(product: ProductModel, quantity: Int) {
    if let index = items.firstIndex(where: { $0.product.id == product.id }) {
      items[index].quantity += quantity
    } else {
      let newItem = CartItem(product: product, quantity: quantity)
      items.append(newItem)
    }
  }
  
  func removeFromCart(product: ProductModel) {
    items.removeAll { $0.product.id == product.id }
  }
  
  var totalPrice: Double {
    items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
  }
}
