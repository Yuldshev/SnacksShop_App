import SwiftUI

struct MainView: View {
  
  //MARK: - Properties
  @StateObject var cartManager = CartManager()
  @StateObject var viewModel = ProductViewModel()
  @State private var isCartPresented = false
  @State private var path = NavigationPath()
  
  //MARK: - Body
  var body: some View {
    NavigationStack(path: $path) {
      ZStack(alignment: .bottom) {
        HomeView(path: $path)
          .environmentObject(cartManager)
          .environmentObject(viewModel)
        
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
      .animation(.default, value: cartManager.items.count)
      .sheet(isPresented: $isCartPresented) {
        CartView().environmentObject(cartManager)
      }
    }
  }
}

#Preview {
  MainView()
}
