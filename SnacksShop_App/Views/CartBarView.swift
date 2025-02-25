import SwiftUI

struct CartBarView: View {
  
  //MARK: - Properties
  @EnvironmentObject var cartManager: CartManager
  
  //MARK: - Body
  var body: some View {
    HStack {
      Text("\(cartManager.items.count)")
        .font(.jakartaBold(size: 12))
        .padding()
        .background(.sAccent)
        .clipShape(Circle())
        .padding(.trailing, 10)
      
      VStack(alignment: .leading) {
        Text("Cart")
          .font(.jakartaBold(size: 22))
          .foregroundStyle(.sLight)
        
        Text("\(cartManager.items.count) Item")
          .font(.jakartaRegular(size: 18))
          .foregroundStyle(.sLight.opacity(0.5))
      }
      
      Spacer()
      
      HStack(spacing: -20.0) {
        ForEach(cartManager.items.prefix(4), id: \.id) { item in
          Image(item.product.image)
            .resizable()
            .scaledToFit()
            .padding()
            .frame(width: 60, height: 60)
            .background(.sLight)
            .clipShape(Circle())
            .overlay {
              Circle().stroke(.sDark, lineWidth: 3)
            }
        }
      }
    }
    .padding(30)
    .frame(height: 115)
    .background(.sDark)
    .clipShape(.rect(
      topLeadingRadius: 40,
      bottomLeadingRadius: 0,
      bottomTrailingRadius: 0,
      topTrailingRadius: 40
    ))
  }
}
