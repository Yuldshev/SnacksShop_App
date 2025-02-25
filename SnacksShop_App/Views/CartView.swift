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
        
        CartItemsView().environmentObject(cartManager)
      }
    }
    .navigationBarBackButtonHidden(true)
  }
}

//MARK: - CartItemsView
struct CartItemsView: View {
  
  //MARK: - Properties
  @EnvironmentObject var cartManager: CartManager
  
  //MARK: - Body
  var body: some View {
    VStack(spacing: 20) {
      LazyVStack {
        ForEach(cartManager.items, id: \.id) { item in
          HStack {
            Image(item.product.image)
              .resizable()
              .scaledToFit()
              .frame(width: 20, height: 30)
              .padding()
              .background(.sLight)
              .clipShape(Circle())
            
            VStack(alignment: .leading) {
              Text(item.product.name)
                .foregroundStyle(.sLight)
                .font(.jakartaRegular(size: 18))
              
              Text("\(item.product.category.rawValue)")
                .foregroundStyle(.sLight.opacity(0.5))
                .font(.jakartaRegular(size: 12))
            }
            
            Spacer()
            
            Text("$\(Int(item.product.price))")
              .foregroundStyle(.sLight)
              .font(.jakartaBold(size: 18))
            
          }
        }
      }
      VStack(alignment: .leading) {
        HStack {
          Text("Delivery Amount")
            .font(.jakartaRegular(size: 12))
          
          Spacer()
          
          Text("$4")
            .font(.jakartaBold(size: 18))
        }
        
        Divider().padding(.bottom, 20)
        
        Text("Total Amount")
          .font(.jakartaRegular(size: 18))
        
        Text("USD \(Int(cartManager.totalPrice + 4))")
          .font(.jakartaBold(size: 36))
      }
      .padding(30)
      .background(.sAccent)
      .clipShape(RoundedRectangle(cornerRadius: 40))
      
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .frame(height: 750)
    .padding(30)
    .background(.sDark)
    .clipShape(.rect(
      topLeadingRadius: 40,
      bottomLeadingRadius: 0,
      bottomTrailingRadius: 0,
      topTrailingRadius: 40
    ))
  }
}

//MARK: - Previre
#Preview {
  CartView().environmentObject(CartManager())
}
