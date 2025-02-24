import SwiftUI

struct ProductCardView: View {
  
  //MARK: - Properties
  let product: ProductModel
  let isLarge: Bool
  
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
          .font(.jakartaBold(size: isLarge ? 36: 19))
          .frame(width: isLarge ? 170 : 89, height: isLarge ? 100 : 50, alignment: .leading)
        
        Text(product.category.rawValue)
          .font(.jakartaRegular(size: isLarge ? 12 : 6))
          .padding(isLarge ? 20 : 10)
          .background(.white)
          .clipShape(Capsule())
        
        Spacer()
        
        HStack {
          Text("$ \(Int(product.price))")
            .font(.jakartaBold(size: isLarge ? 18 : 12))
          
          Spacer()
          
          Image(isLarge ? "iconBagBig" : "iconBag")
            .foregroundStyle(.sLight)
            .frame(width: isLarge ? 94 : 52, height: isLarge ? 64 : 32)
            .background(.sDark)
            .clipShape(Capsule())
        }
        .padding(.horizontal, 6)
        .padding(.leading, isLarge ? 24 : 10)
        .frame(height: isLarge ? 76 : 40)
        .frame(maxWidth: .infinity)
        .background(.ultraThickMaterial.opacity(0.9))
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

#Preview {
  ProductCardView(
    product: ProductModel(name: "Good Source", category: .choco, image: "goodSource", price: 8, color: .cPink, description: ""),
    isLarge: true
  )
}
