import SwiftUI

struct MainView: View {
  
  //MARK: - Properties
  @StateObject var cartManager = CartManager()
  @State private var isCartPresented = false
  
  //MARK: - Body
  var body: some View {
    NavigationStack {
      ZStack(alignment: .bottom) {
        HomeView().environmentObject(cartManager)
        
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
      .animation(.easeInOut(duration: 0.3), value: cartManager.items.count)
      .sheet(isPresented: $isCartPresented) {
        CartView().environmentObject(cartManager)
      }
    }
  }
}

#Preview {
  MainView()
}
