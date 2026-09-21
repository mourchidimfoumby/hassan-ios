import SwiftUI
import Combine

struct PlainTableView<
    Value: Hashable,
    Header: View,
    Content: View,
>: View {
    var modifier: PlainTableModifier<Value>
    let values: [Value]
    let onRowClick: (Value) -> Void
    let header: (() -> Header)?
    let content: (Int, Value) -> Content
    
    init(
        modifier: PlainTableModifier<Value> = .init(),
        values: [Value],
        onRowClick: @escaping (Value) -> Void,
        @ViewBuilder content: @escaping (Value) -> Content
    ) where Header == Never {
        self.modifier = modifier
        self.values = values
        self.onRowClick = onRowClick
        self.header = nil
        self.content = { _, value in
            content(value)
        }
    }
    
    var body: some View {
        PlainTableUIViewControllerRepresentable(
            modifier: modifier,
            values: values,
            onRowClick: onRowClick,
            header: header,
            content: content
        )
        .ignoresSafeArea(.all)
    }
}

extension PlainTableView {
    init(
        modifier: PlainTableModifier<Value> = .init(),
        values: [Value],
        onRowClick: @escaping (Value) -> Void,
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping (Value) -> Content
    ) {
        self.modifier = modifier
        self.values = values
        self.onRowClick = onRowClick
        self.header = header
        self.content = { _, value in
            content(value)
        }
    }
}

#Preview {
    NavigationStack {
        PlainTableView(
            values: Array(0..<50),
            onRowClick: { _ in }
        ) { number in
            Text(number.description)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
