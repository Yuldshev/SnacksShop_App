import SwiftUI

enum ProductCategory: String, CaseIterable {
  case all = "All"
  case choco = "Choco"
  case chips = "Chips"
  case candy = "Candy"
}

struct CategoryModel: Identifiable, Hashable {
  let id = UUID()
  let icon: String
  let title: ProductCategory
}

let categoryList: [CategoryModel] = [
  CategoryModel(icon: "", title: .all),
  CategoryModel(icon: "iconChoco", title: .choco),
  CategoryModel(icon: "iconChips", title: .chips),
  CategoryModel(icon: "iconCandy", title: .candy)
]

