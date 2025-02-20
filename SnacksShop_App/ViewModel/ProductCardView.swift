import SwiftUI

struct ProductCard: View {
  @Binding var selectedCategory: ProductCategory
  
  var body: some View {
    ForEach(productList.filter { selectedCategory == .all || $0.category == selectedCategory }, id: \.id) { item in
      ZStack {
        Image(item.image)
          .resizable()
          .scaledToFit()
          .padding(.trailing, -200)
          .rotationEffect(Angle(degrees: 30))
        
        VStack(alignment: .leading) {
          Text(item.name)
            .font(.jakartaBold(size: 36))
            .frame(width: 160)
            .padding(.leading, -18)
          
          Text(item.category.rawValue)
            .font(.jakartaRegular(size: 14))
            .padding()
            .background(.sSecondary.opacity(0.8))
            .clipShape(Capsule())
          
          Spacer()
          
          HStack {
            Text("$ 0\(item.price).00")
              .font(.jakartaBold(size: 19))
            
            Spacer()
            
            Button(action: {
              print("Hi")
            }) {
              Image("iconBag")
                .resizable()
                .scaledToFit()
                .frame(width: 26, height: 26)
                .foregroundStyle(.sSecondary)
                .padding()
                .frame(width: 86, height: 65)
                .background(.sDark)
                .clipShape(Capsule())
            }
          }
          .frame(height: 77)
          .padding(.horizontal, 6)
          .padding(.leading, 40)
          .background(.thickMaterial.opacity(0.96))
          .clipShape(Capsule())
          .overlay(Capsule().stroke(
            LinearGradient(
              gradient: Gradient(colors:
                                  [.white, .white.opacity(0)]),
              startPoint: .topLeading,
              endPoint: .bottomTrailing),
            lineWidth: 2))
        }
      }
      .padding(30)
      .frame(width: 336, height: 422)
      .background(item.color)
      .clipShape(RoundedRectangle(cornerRadius: 58))
      .padding(.leading, 30)
    }
  }
}

