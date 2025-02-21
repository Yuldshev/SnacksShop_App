import SwiftUI

struct HomeView: View {
  
  //MARK: - Properties
  @State private var selectedCategory: ProductCategory = .choco
  
  //MARK: - Body
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack {
          HeaderBarView(title: "Snacks", category: "Shop", button: "menu")
          categoryListView
          detailCategoryListView
          productListView
        }
      }
    }
  }
}

//MARK: - Extension View
extension HomeView {
  var categoryListView: some View {
    HStack {
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHStack {
          CategoryListView(selectedCategory: $selectedCategory)
        }
      }
    }
    .padding(.leading, 30)
  }
  
  var detailCategoryListView: some View {
    HStack {
      NavigationLink {
        CollectionView(selectedCategory: $selectedCategory)
      } label: {
        Text("\(selectedCategory.rawValue) **Collections**")
          .font(.jakartaRegular(size: 25))
        Spacer()
        Image("iconMiniBack")
      }
      .tint(.sDark)
    }
    .padding(30)
  }
  
  var productListView: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack {
        ProductCardView(selectedCategory: $selectedCategory)
      }
    }
  }
}

//MARK: - Preview
#Preview {
  HomeView()
}
