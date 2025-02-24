import SwiftUI

struct ProductView: View {
  
  //MARK: - Properties
  @State var isActive: Category
  
  //MARK: - Body
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack {
        ForEach(productList.filter { isActive == .all || $0.category == isActive }, id: \.id) { item in
          ProductCardView(product: item, isLarge: true)
            .padding(.trailing, 20)
        }
      }
      .padding(.leading, 30)
    }
  }
}

#Preview {
  ProductView(isActive: .all)
}
