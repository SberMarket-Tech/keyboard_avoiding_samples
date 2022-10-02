import SwiftUI

struct KeyboardAvoidingPalette: View {
    private let samples: [(title: String, view: AnyView)] = [
        ("Window Tap", AnyView(KeyboardAvoidingWindowTapSample())),
        ("Partial Avoiding + Local Tap", AnyView(KeyboardAvoidingPartialSample()))
    ]
    
    @State private var isModalPresented = false
    
    var body: some View {
        List {
            ForEach(samples, id: \.title) { sample in
                NavigationLink(destination: sample.view) {
                    Text(sample.title)
                }
            }

            Button("Show Modal Partial") {
                isModalPresented.toggle()
            }

        }
        .sheet(isPresented: $isModalPresented) {
            KeyboardAvoidingPartialModalSample(isPresented: $isModalPresented)
        }
        .navigationBarTitle(Text("Keyboard Avoiding"))
    }
}
