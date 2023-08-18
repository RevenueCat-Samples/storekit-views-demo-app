import SwiftUI
import StoreKit

struct SubscriptionStoreViewDemo: View {
    let privacyUrl = URL(string: "https://www.google.com/search?q=privacy+policy")!
    let termsUrl = URL(string: "https://www.google.com/search?q=terms+of+service")!
    
    var body: some View {
        SubscriptionStoreView(groupID: PurchaseManager.subscriptionGroupId, visibleRelationships: .all) {
            headerContent
            .containerBackground(for: .subscriptionStoreFullHeight) {
                LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        }
        .backgroundStyle(.clear)
        .subscriptionStoreButtonLabel(.singleLine)
        .subscriptionStorePickerItemBackground(.thinMaterial)
        .subscriptionStoreControlBackground(.automatic)
        .subscriptionStorePolicyDestination(url: privacyUrl, for: .privacyPolicy)
        .subscriptionStorePolicyDestination(url: termsUrl, for: .termsOfService)
        .subscriptionStorePolicyForegroundStyle(.thickMaterial, .thinMaterial)
        .storeButton(.visible, for: .restorePurchases)
        .storeButton(.visible, for: .redeemCode)
        .subscriptionStoreControlIcon { product, subscriptionInfo in
            ProductImage(productId: product.id)
                .frame(height: 18)
        }
    }
    
    var headerContent: some View {
        VStack(spacing: 16) {
            Image(systemName: "dollarsign.square.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.green)
                .frame(height: 100)
            Text("Subscribe to Pro!")
                .font(.title)
                .bold()
            Text("Please buy me 🙏")
                .font(.subheadline.weight(.medium))
                .fontDesign(.rounded)
                .multilineTextAlignment(.center)
        }
        .padding()
        .foregroundColor(.white)
    }
}

#Preview {
    SubscriptionStoreViewDemo()
}
