//

import SwiftUI

struct KeyboardAvoidingPartialSample: View {
    private let itemsBeforeTextField = Array(0 ... 17)
    private let itemsAfterTextField = Array(18 ... 22)
    private let minInteractiveHeight: CGFloat = 44
    private let bottomTextHeight: CGFloat = 56
    
    @State private var text: String = ""

    var body: some View {
        ZStack {
            Color.orange.opacity(0.2)

            ZStack {
                VStack(spacing: .zero) {
                    Spacer(minLength: .zero)

                    Text("Bottom")
                        .frame(height: bottomTextHeight)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .addTapToEndEditing()
                }

                ScrollView {
                    VStack(spacing: .zero) {
                        Text("Keyboard dismisal tap is applied to each View individually.")

                        ForEach(itemsBeforeTextField, id: \.self) { item in
                            Text(String(item))
                                .frame(height: minInteractiveHeight)
                                .frame(maxWidth: .infinity)
                                .contentShape(Rectangle())
                        }
                        .addTapToEndEditing()

                        CustomTextField(text: $text)
                            .padding(.horizontal)

                        ForEach(itemsAfterTextField, id: \.self) { item in
                            Text(String(item))
                                .frame(height: minInteractiveHeight)
                                .frame(maxWidth: .infinity)
                                .contentShape(Rectangle())
                        }
                        .addTapToEndEditing()
                    }
                }
                .scrollAvoidKeyboard(partialAvoidingPadding: bottomTextHeight)
                .padding(.bottom, bottomTextHeight)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigationTitle("Partial Avoiding Sample")
    }
}
