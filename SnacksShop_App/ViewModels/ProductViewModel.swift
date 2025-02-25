import SwiftUI

class ProductViewModel: ObservableObject {
  @Published var products: [ProductModel] = productList
  @Published var selectedCategory: Category = .all
  
  var filteredProducts: [ProductModel] {
    selectedCategory == .all ? products : products.filter { $0.category == selectedCategory }
  }
  
  func updateCategory(_ category: Category) {
    selectedCategory = category
    objectWillChange.send()
  }
}
