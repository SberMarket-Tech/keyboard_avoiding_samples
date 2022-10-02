//

import SwiftUI

struct KeyboardAvoidingPartialModalSample: View {
    private let itemsBeforeTextField = Array(0 ... 17)
    private let itemsAfterTextField = Array(18 ... 22)
    private let minInteractiveHeight: CGFloat = 44
    private let bottomTextHeight: CGFloat = 56

    @Binding private var isPresented: Bool

    @State private var bottomSafeArea: CGFloat = 0
    @State private var keybaordIsShown: Bool = false
    @State private var text: String = ""

    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented
    }

    var body: some View {
        ZStack {
            Color.orange.opacity(0.2)

            ZStack {
                VStack(spacing: .zero) {
                    Spacer(minLength: .zero)

                    Button("Hide Modal") {
                        isPresented.toggle()
                    }
                    .frame(height: bottomTextHeight)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
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
            .padding(.top)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
