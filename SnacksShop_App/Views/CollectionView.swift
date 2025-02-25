import SwiftUI

struct CollectionView: View {
  
  //MARK: - Properties
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var cartManager: CartManager
  @State private var isCartPresented = false
  @StateObject var viewModel = ProductViewModel()
  
  //MARK: - Body
  var body: some View {
    ZStack(alignment: .bottom) {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          HeaderView(
            title: Text("**\(viewModel.selectedCategory.rawValue)** Collection"),
            buttonType: .back,
            buttonAction: { dismiss() }
          )
          
          LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(viewModel.filteredProducts, id: \.id) { item in
              NavigationLink {
                DetailsProductView(product: item)
                  .environmentObject(cartManager)
              } label: {
                ProductCardView(product: item, isLarge: false)
                  .padding(.bottom, 10)
              }
            }
          }
          .padding(20)
        }
      }
      if cartManager.items.count > 0 {
        Button {
          isCartPresented.toggle()
        } label: {
          CartBarView().environmentObject(cartManager)
        }
        .transition(.move(edge: .bottom))
      }
    }
    .padding(.top, 60)
    .ignoresSafeArea()
    .navigationBarBackButtonHidden(true)
    .animation(.default, value: cartManager.items.count)
    .sheet(isPresented: $isCartPresented) {
      CartView().environmentObject(cartManager)
    }
  }
}

