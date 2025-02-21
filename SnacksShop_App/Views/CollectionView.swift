import SwiftUI

struct CollectionView: View {
  
  //MARK: - Properties
  @Binding var selectedCategory: ProductCategory
  
  //MARK: - Body
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          HeaderBarView(title: "Collection", category: "\(selectedCategory.rawValue)", button: "back")
          SmallProductCard(selectedCategory: $selectedCategory)
        }
      }
    }
  }
}


