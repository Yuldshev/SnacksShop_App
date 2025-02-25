import SwiftUI

struct ProductView: View {
  
  // MARK: - Properties
  @EnvironmentObject var cartManager: CartManager
  @StateObject var viewModel = ProductViewModel()
  
  // MARK: - Body
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack {
        ForEach(viewModel.filteredProducts, id: \.id) { item in
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
