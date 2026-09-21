import SwiftUI

struct PagedCollectionUIViewControllerRepresentable<
    Value: Hashable,
    Content: View
>: UIViewControllerRepresentable {
    typealias Controller = PagedCollectionUIViewController<Value, Content>
    
    @Binding var state: PagerState
    let values: [Value]
    let onCellClick: ((Value) -> Void)?
    let content: (Value) -> Content
    
    init(
        state: Binding<PagerState>,
        values: [Value],
        onCellClick: ((Value) -> Void)? = nil,
        content: @escaping (Value) -> Content
    ) {
        self._state = state
        self.values = values
        self.onCellClick = onCellClick
        self.content = content
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIViewController(context: Context) -> Controller {
        let controller = PagedCollectionUIViewController(
            state: $state,
            onCellClick: onCellClick,
            onPageChange: { state.onPageChange($0) },
            content: content
        )
        controller.coordinator = context.coordinator
        context.coordinator.configure(controller)
        return controller
    }
    
    func updateUIViewController(_ controller: Controller, context: Context) {
        updateSnapshotIfNeeded(coordinator: context.coordinator)
        updatePageIfNeeded(controller: controller)
    }
    
    private func updateSnapshotIfNeeded(coordinator: Coordinator) {
        if coordinator.values != values {
            coordinator.updateSnapshot(values)
        }
    }
    
    private func updatePageIfNeeded(controller: Controller) {
        if let targetPage = state.targetPage, targetPage < values.count {
            controller.collectionView.scrollToItem(
                at: IndexPath(item: targetPage, section: 0),
                at: .centeredHorizontally,
                animated: false
            )
        }
    }
    
    class Coordinator {
        private typealias DataSource = UICollectionViewDiffableDataSource<Int, Value>
        private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Value>

        private var dataSource: DataSource!
        
        private(set) var values: [Value]? = nil
        
        func configure(_ controller: Controller) {
            dataSource = DataSource(
                collectionView: controller.collectionView,
                cellProvider: { collectionView, indexPath, _ in
                    controller.makePagingCell(collectionView: collectionView, indexPath: indexPath)
                }
            )
        }
        
        func updateSnapshot(_ values: [Value]) {
            self.values = values
            var snapshot = Snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(values)
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
}

struct PagerState {
    private(set) var currentPage: Int = 0
    private(set) var targetPage: Int? = nil
    
    init() {}
    
    mutating func scrollToPage(_ page: Int) {
        if currentPage != page && targetPage != page {
            targetPage = page
        }
    }
    
    fileprivate mutating func onPageChange(_ page: Int) {
        currentPage = page
        targetPage = nil
    }
}
