//

import SwiftUI

struct CustomTextField: View {
    @Binding private var text: String
    
    init(text: Binding<String>) {
        _text = text
    }
    
    var body: some View {
        ZStack {
            Color.white
            
            TextField("Placeholder", text: $text)
                .padding(.horizontal)
        }
        .frame(height: 50.0)
        .cornerRadius(8.0)
    }
}
