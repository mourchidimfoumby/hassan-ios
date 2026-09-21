import SwiftUI

struct PlainTableUIViewControllerRepresentable<
    Value: Hashable,
    Header: View,
    Content: View
>: UIViewControllerRepresentable {
    typealias Controller = PlainTableUIViewController<Value, Header, Content>
    typealias Modifier = PlainTableModifier<Value>
    
    let modifier: Modifier
    let values: [Value]
    let onRowClick: (Value) -> Void
    let header: (() -> Header)?
    let content: (Int, Value) -> Content
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIViewController(context: Context) -> Controller {
        let controller = PlainTableUIViewController(
            modifier: modifier,
            onRowClick: onRowClick,
            header: header,
            content: content
        )
        controller.coordinator = context.coordinator
        context.coordinator.configure(controller)
        
        return controller
    }

    func updateUIViewController(_ controller: Controller, context: Context) {
        updateTableView(controller: controller, coordinator: context.coordinator)
        updateSnapshotIfNeeded(coordinator: context.coordinator)
    }
    
    private func updateTableView(controller: Controller, coordinator: Coordinator) {
        controller.tableView.allowsSelection = !values.isEmpty
        controller.tableView.separatorStyle = values.isEmpty ? .none : modifier.separatorStyle
        if let header {
            controller.makeHeader(header: header())
        }
        
    }
    
    private func updateSnapshotIfNeeded(coordinator: Coordinator) {
        if coordinator.values != values {
            coordinator.updateSnapshot(values)
        }
    }
    
    class Coordinator {
        private typealias DataSource = UITableViewDiffableDataSource<Int, Value>
        private typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Value>
        
        private var dataSource: DataSource!
        
        private(set) var values: [Value]? = nil
        
        func configure(_ controller: Controller) {
            dataSource = DataSource(
                tableView: controller.tableView,
                cellProvider: { tableView, indexPath, item in
                    controller.makePlainCell(tableView: tableView, indexPath: indexPath)
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
