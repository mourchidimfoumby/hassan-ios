import SwiftUI

struct PagedCollectionView<
    Value: Hashable,
    Content: View
>: View {
    @Binding var state: PagerState
    let values: [Value]
    let onCellClick: ((Value) -> Void)?
    let content: (Value) -> Content
    
    init(
        state: Binding<PagerState> = .constant(PagerState()),
        values: [Value],
        onCellClick: @escaping (Value) -> Void,
        @ViewBuilder content: @escaping (Value) -> Content
    ) {
        self._state = state
        self.values = values
        self.onCellClick = onCellClick
        self.content = content
    }

    var body: some View {
        PagedCollectionUIViewControllerRepresentable(
            state: $state,
            values: values,
            onCellClick: onCellClick,
            content: content
        )
    }
}

extension PagedCollectionView {
    init(
        state: Binding<PagerState> = .constant(PagerState()),
        values: [Value],
        @ViewBuilder content: @escaping (Value) -> Content
    ) {
        self._state = state
        self.values = values
        self.onCellClick = nil
        self.content = content
    }
}

#Preview {
    PagedCollectionView(
        state: .constant(PagerState()),
        values: Array(0..<50),
        onCellClick: { _ in }
    ) { value in
        Text(value.description)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(r: 10 * value, g: 20 * value, b: 40 * value))
    }
}
