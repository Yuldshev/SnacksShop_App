import SwiftUI

struct CartView: View {
  
  //MARK: - Properties
  @EnvironmentObject var cartManager: CartManager
  
  //MARK: - Body
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack {
        HeaderView(
          title: Text("Cart"),
          buttonType: .number(cartManager.items.count),
          buttonAction: {
          }).padding(.bottom, 20)
        
        CartItemsListView().environmentObject(cartManager)
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}

