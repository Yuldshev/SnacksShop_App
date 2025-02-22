import Foundation

enum Category: String, CaseIterable {
  case all = "All"
  case choco = "Choco"
  case chips = "Chips"
  case candy = "Candy"
}

struct CategoryModel: Identifiable, Hashable {
  let id = UUID()
  let icon: String
  let name: Category
  
  var displayName: String {
    name.rawValue
  }
}

let categoryList: [CategoryModel] = [
  CategoryModel(icon: "iconAll", name: .all),
  CategoryModel(icon: "iconChoco", name: .choco),
  CategoryModel(icon: "iconChips", name: .chips),
  CategoryModel(icon: "iconCandy", name: .candy)
]
