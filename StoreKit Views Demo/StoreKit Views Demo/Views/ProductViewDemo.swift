import SwiftUI
import StoreKit

struct ProductViewDemo: View {
    var body: some View {
            ScrollView(.vertical) {
                VStack(spacing: 16) {
                    ProductView(id: "pro_yearly") {
                        ProductImage(productId: "pro_yearly")
                    }
                    .productViewStyle(.large)
                    .padding()
                    .background(.thinMaterial, in: .rect(cornerRadius: 20))
                    .foregroundColor(.black)
                    
                    Text("Buy Me Please! 🙏")
                        .font(.largeTitle)
                    
                    
                    header("More Plans")
                    ScrollView(.horizontal) {
                        HStack {
                            regularProductView(id: "pro_monthly")
                            regularProductView(id: "pro_weekly")
                        }
                    }
                    .safeAreaPadding(.horizontal, 16)
                    
                    header("One time purchase")
                    compactProductView(id: "pro_lifetime")
                    
                    restoreButton
                }
                .padding(.top, 32)
            }
            .background(LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .foregroundColor(.white)
            .navigationTitle("ProductViews Demo")
    }
    
    private func regularProductView(id: String) -> some View {
        ProductView(id: id) {
            ProductImage(productId: id)
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 20))
        .productViewStyle(.regular)
        .foregroundColor(.black)
    }
    
    private func compactProductView(id: String) -> some View {
        ProductView(id: id) {
            ProductImage(productId: id)
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 20))
        .productViewStyle(.compact)
        .foregroundColor(.black)
        .padding(.horizontal)
    }
    
    private func header(_ text: String) -> some View {
        HStack {
            Text(text)
                .font(.headline)
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .padding(.top)
    }
    
    var restoreButton: some View {
        Button {
            _ = Task<Void, Never> {
                do {
                    try await AppStore.sync()
                } catch {
                    print(error)
                }
            }
        } label: {
            Text("Restore Purchases")
        }
        .foregroundColor(.blue)
    }
}

#Preview {
    Text("hi")
        .sheet(isPresented: .constant(true), content: {
            ProductViewDemo()
        })
}
