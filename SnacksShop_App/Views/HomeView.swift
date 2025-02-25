import SwiftUI

struct HomeView: View {
  //MARK: - Properties
  @State var isActive: Category = .all
  @EnvironmentObject var cartManager: CartManager
  
  //MARK: - Body
  var body: some View {
    NavigationStack {
      ScrollView {
        HeaderView(
          title: Text("**Snacks** Shop"),
          buttonType: .menu,
          buttonAction: {}
        )
        .padding(.bottom, 30)
        
        CategoryView(isActive: $isActive)
          .padding(.bottom, 20)
        
        collectionScreen
          .padding(.bottom, 16)
        
        ProductView(isActive: $isActive)
      }
      .animation(.easeInOut(duration: 0.3), value: isActive)
    }
    .navigationBarBackButtonHidden(true)
  }
}

//MARK: - Collection
extension HomeView {
  var collectionScreen: some View {
    NavigationLink(destination: CollectionView(isActive: $isActive).environmentObject(cartManager)) {
      HStack {
        Text("**\(isActive.rawValue)** Collections")
          .font(.jakartaRegular(size: 26))
        
        Spacer()
        
        Image(systemName: "arrow.right")
          .font(.title)
      }
      .padding(.horizontal, 30)
    }
  }
}

//MARK: - Preview
#Preview {
  HomeView().environmentObject(CartManager())
}
