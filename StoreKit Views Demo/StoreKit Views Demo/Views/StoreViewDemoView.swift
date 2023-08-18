import SwiftUI
import StoreKit

struct StoreViewDemoView: View {
    var body: some View {
        NavigationView {
            StoreView(ids: PurchaseManager.productIds) { product in
                ProductImage(productId: product.id)
            }
            .storeButton(.visible, for: .restorePurchases)
            .productViewStyle(.compact)
            .navigationTitle("StoreView Demo")
        }
    }
}

#Preview {
    StoreViewDemoView()
}
