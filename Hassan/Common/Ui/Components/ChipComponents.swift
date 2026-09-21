import SwiftUI

struct FilterChip: View {
    let label: String
    let selected: Bool
    let onClick: () -> Void
    
    var body: some View {
        Button(action: onClick) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.horizontal, chipPadding.horizontal)
                .frame(minHeight: chipMinHeight)
                .padding(.horizontal, chipPadding.horizontal)
                .padding(.vertical, chipPadding.vertical)
                .applyFilterChipStyle(selected)
        }
        .buttonStyle(.plain)
    }
}


private extension View {
    func applyFilterChipStyle(_ selected: Bool) -> some View {
        Group {
            if selected {
                self
                    .foregroundStyle(.onSecondaryContainer)
                    .background(Color.secondaryContainer)
                    .clipShape(Shapes.cornerSmall)
            } else {
                self
                    .foregroundStyle(.onSurfaceVariant)
                    .overlay {
                        Shapes.cornerSmall
                            .strokeBorder(.outline)
                    }
            }
        }
    }
}

private let chipPadding: PaddingValues = PaddingValues(horizontal: dimensionResource(.smallPadding))
private let chipMinHeight: CGFloat = 32

#Preview {
    FilterChip(
        label: "Filter chip",
        selected: true,
        onClick: {}
    )
}
