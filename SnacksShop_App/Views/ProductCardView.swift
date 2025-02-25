import SwiftUI

struct ProductCardView: View {
  
  //MARK: - Properties
  let product: ProductModel
  let isLarge: Bool
  @EnvironmentObject var cartManager: CartManager
  
  //MARK: - Body
  var body: some View {
    ZStack {
      Image(product.image)
        .resizable()
        .scaledToFit()
        .padding(.trailing, -200)
        .rotationEffect(.degrees(35))
      
      
      VStack(alignment: .leading) {
        Text(product.name)
          .foregroundStyle(.black)
          .font(.jakartaBold(size: isLarge ? 36: 19))
          .frame(width: isLarge ? 170 : 89, height: isLarge ? 100 : 50, alignment: .leading)
          .multilineTextAlignment(.leading)
        
        Text(product.category.rawValue)
          .foregroundStyle(.black)
          .font(.jakartaRegular(size: isLarge ? 12 : 6))
          .padding(isLarge ? 20 : 10)
          .background(.white)
          .clipShape(Capsule())
        
        Spacer()
        
        HStack {
          Text("$ \(Int(product.price))")
            .foregroundStyle(.black)
            .font(.jakartaBold(size: isLarge ? 18 : 12))
          
          Spacer()
          
          Button {
            cartManager.addToCart(product: product, quantity: 1)
          } label: {
            Image(isLarge ? "iconBagBig" : "iconBag")
              .foregroundStyle(.white)
              .frame(width: isLarge ? 94 : 52, height: isLarge ? 64 : 32)
              .background(.black)
              .clipShape(Capsule())
          }
          
        }
        .padding(.horizontal, 6)
        .padding(.leading, isLarge ? 24 : 10)
        .frame(height: isLarge ? 76 : 40)
        .frame(maxWidth: .infinity)
        .background(.white.opacity(0.7))
        .clipShape(Capsule())
        .overlay {
          Capsule().stroke(
            LinearGradient(
              colors: [Color.white, Color.white.opacity(0)],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            ),
            lineWidth: 2
          )
        }
      }
      .padding(isLarge ? 30 : 16)
    }
    .frame(width: isLarge ? 298 : 156, height: isLarge ? 367 : 192)
    .background(product.color)
    .clipShape(RoundedRectangle(cornerRadius: isLarge ? 40 : 20))
  }
}
