import SwiftUI

struct CategoryView: View {
  
  // MARK: - Properties
  @State private var isActive: Category = .choco
  
  // MARK: - Body
  var body: some View {
    HStack {
      ForEach(categoryList, id: \ .id) { item in
        CategoryItemView(
          category: item,
          isActive: isActive == item.name,
          action: { selectCategory(item.name) }
        )
      }
    }
  }
  
  // MARK: - Methods
  private func selectCategory(_ category: Category) {
    withAnimation(.easeInOut(duration: 0.3)) {
      isActive = category
    }
  }
}

// MARK: - CategoryItemView
struct CategoryItemView: View {
  let category: CategoryModel
  let isActive: Bool
  let action: () -> Void
  
  var body: some View {
    Button(action: action) {
      HStack(alignment: .center) {
        if let icon = category.icon, isActive {
          Image(icon)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.sLight)
            .frame(width: 18, height: 18)
        }
        
        Text(category.displayName)
          .font(.jakartaMedium(size: 12))
      }
      .frame(height: 70)
      .frame(width: isActive ? 110 : 70)
      .background(isActive ? .sDark : .sLight)
      .foregroundStyle(isActive ? .sLight : .sDark)
      .clipShape(Capsule())
    }
    .animation(.easeInOut(duration: 0.3), value: isActive)
  }
}

// MARK: - Preview
#Preview {
  CategoryView()
}
