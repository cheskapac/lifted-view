import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Text("Top").foregroundColor(.black)
                Spacer()
                Text("Bottom").foregroundColor(.black)
                Divider().background(Color.red)
            }
        }
    }
}
