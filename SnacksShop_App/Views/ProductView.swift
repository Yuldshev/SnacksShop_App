import SwiftUI

struct ProductView: View {
  
  // MARK: - Properties
  @Binding var isActive: Category
  @EnvironmentObject var cartManager: CartManager
  
  // MARK: - Body
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack {
        ForEach(productList.filter { isActive == .all || $0.category == isActive }, id: \.id) { item in
          NavigationLink {
            DetailsProductView(product: item)
              .environmentObject(cartManager)
          } label: {
            ProductCardView(product: item, isLarge: true)
              .padding(.trailing, 20)
          }
        }
      }
      .padding(.leading, 30)
    }
  }
}
