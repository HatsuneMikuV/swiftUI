//
//  SwiftUITableView.swift
//  SwiftUIDemo
//
//  Created by Joe on 2020/5/7.
//  Copyright © 2020 AngleMiku. All rights reserved.
//

import SwiftUI
import MobileCoreServices

struct SwiftUITableView: View {

    @State private var links: [URL] = [
        URL(string: "https://twitter.com/mecid")!,
        URL(string: "https://twitter.com/mecid")!,
        URL(string: "https://twitter.com/mecid")!
    ]

    var body: some View {
        List {
            ForEach(links, id: \.self) { url in
                Text(url.absoluteString)
                    .onDrag { NSItemProvider(object: url as NSURL) }
            }
            .onInsert(of: ["public.url"], perform: drop)
        }
        .navigationBarTitle("Bookmarks")
    }
    
    private func drop(at index: Int, _ items: [NSItemProvider]) {
        for item in items {
            _ = item.loadObject(ofClass: URL.self) { url, _ in
                DispatchQueue.main.async {
                    url.map { self.links.insert($0, at: index) }
                }
            }
        }
    }
}




#if DEBUG

struct SwiftUITableView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITableView()
    }
}
#endif

struct TableView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> TableViewController {
        let v = TableViewController()
        return v
    }

    func updateUIViewController(_ viewController: TableViewController, context: Context) {

    }

}

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITableViewDragDelegate {

    var tableView = UITableView()

    var data = [1, 2, 3, 4, 5]
    
    // MARK: - View controller
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dragInteractionEnabled = true
        self.tableView.dragDelegate = self
        tableView.frame = view.bounds
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(self.tableView)
    }

    // MARK: - Table view drag delegate
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        // fake implementation with empty list
        return [UIDragItem(itemProvider: NSItemProvider(object: "123" as NSItemProviderWriting))]
    }

    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Cell \(data[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tmp = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(tmp, at: destinationIndexPath.row)
    }
}
