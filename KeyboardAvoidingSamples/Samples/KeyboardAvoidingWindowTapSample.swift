//

import SwiftUI

struct KeyboardAvoidingWindowTapSample: View {
    private let itemsBeforeTextField = Array(0 ... 17)
    private let itemsAfterTextField = Array(18 ... 22)

    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            Color.orange.opacity(0.2)

            ScrollView {
                VStack(spacing: .zero) {
                    Text("Keyboard dismisal tap is applied to the whole window.")
                    
                    ForEach(itemsBeforeTextField, id: \.self) { item in
                        Text(String(item)).frame(height: 44)
                    }

                    CustomTextField(text: $text)
                        .padding(.horizontal)

                    ForEach(itemsAfterTextField, id: \.self) { item in
                        Text(String(item)).frame(height: 44)
                    }

                    Text("Bottom")
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("Window Tap Sample")
        .scrollAvoidKeyboard(dismissKeyboardByTap: true)
    }
}
