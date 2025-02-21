import SwiftUI

struct SmallProductCard: View {
  
  //MARK: - Properties
  @Binding var selectedCategory: ProductCategory
  
  //MARK: - Body
  var body: some View {
    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
      ForEach(productList.filter { selectedCategory == .all || $0.category == selectedCategory }, id: \.id) { item in
        ZStack {
          Image(item.image)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .padding(.trailing, -100)
            .rotationEffect(Angle(degrees: 30))
          
          VStack(alignment: .leading) {
            Text(item.name)
              .font(.jakartaBold(size: 18))
              .frame(width: 86)
              .padding(.leading, -5)
            
            Text(item.category.rawValue)
              .font(.jakartaRegular(size: 8))
              .padding(8)
              .background(.sSecondary.opacity(0.8))
              .clipShape(Capsule())
            
            Spacer()
            
            HStack {
              Text("$ 0\(item.price).00")
                .font(.jakartaBold(size: 9))
              
              Spacer()
              
              Button(action: {
                print("Hi")
              }) {
                Image("iconBag")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 14, height: 14)
                  .foregroundStyle(.sSecondary)
                  .padding()
                  .frame(width: 44, height: 34)
                  .background(.sDark)
                  .clipShape(Capsule())
              }
            }
            .frame(height: 40)
            .padding(.horizontal, 6)
            .padding(.leading, 20)
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
          .padding(12)
          .frame(width: 172, height: 216)
        }
        .background(item.color)
        .clipShape(RoundedRectangle(cornerRadius: 30))
      }
    }
    .padding(.horizontal)
  }
}


