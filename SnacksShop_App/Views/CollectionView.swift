import SwiftUI

struct CollectionView: View {
  
  //MARK: - Properties
  @Binding var isActive: Category
  @Environment(\.dismiss) var dismiss
  
  //MARK: - Body
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        HeaderView(
          title: Text("**\(isActive.rawValue)** Collection"),
          buttonType: .back,
          buttonAction: { dismiss() }
        )
        
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
          ForEach(productList.filter { isActive == .all || $0.category == isActive }, id: \.id) { item in
            NavigationLink {
              DetailsProductView(product: item, count: CartItem(product: item, quantity: 0))
            } label: {
              ProductCardView(product: item, isLarge: false)
                .padding(.bottom, 10)
            }
          }
        }
        .padding(20)
      }
    }
    .toolbar(.hidden, for: .navigationBar)
  }
}

