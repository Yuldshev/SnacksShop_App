import SwiftUI

struct CategoryListView: View {
  @Binding var selectedCategory: ProductCategory
  
  var body: some View {
    ForEach(categoryList, id: \.id) { item in
      Button {
        selectedCategory = item.title
      } label: {
        HStack {
          if item.title != .all {
            Image(item.icon)
              .resizable()
              .scaledToFit()
              .frame(width: 21)
          }
          
          Text(item.title.rawValue)
            .font(.jakartaMedium(size: 13))
        }
        .padding(20)
        .background(selectedCategory == item.title ? .sDark : .sSecondary)
        .tint(selectedCategory == item.title ? .sAccent : .sDark)
        .clipShape(Capsule())
      }
    }
  }
}
