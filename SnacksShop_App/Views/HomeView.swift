import SwiftUI

struct HomeView: View {
  //MARK: - Properties
  @EnvironmentObject var viewModel: ProductViewModel
  @EnvironmentObject var cartManager: CartManager
  @Binding var path: NavigationPath
  
  //MARK: - Body
  var body: some View {
    ScrollView {
      HeaderView(
        title: Text("**Snacks** Shop"),
        buttonType: .menu,
        buttonAction: {}
      )
      .padding(.bottom, 30)
      
      CategoryView()
        .padding(.bottom, 20)
      
      collectionScreen
        .padding(.bottom, 16)
      
      ProductView()
    }
    .animation(.default, value: viewModel.selectedCategory)
    .navigationBarBackButtonHidden(true)
  }
}

//MARK: - Collection
extension HomeView {
  var collectionScreen: some View {
    NavigationLink(destination: CollectionView()
      .environmentObject(cartManager)
      .environmentObject(viewModel)
    ) {
      HStack {
        Text("**\(viewModel.selectedCategory.rawValue)** Collections")
          .font(.jakartaRegular(size: 26))
        
        Spacer()
        
        Image(systemName: "arrow.right")
          .font(.title)
      }
      .padding(.horizontal, 30)
    }
  }
}

