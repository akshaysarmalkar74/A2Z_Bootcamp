class Node {
    var value: Int
    var next: Node?

    init(_ value: Int) {
        self.value = value
    }
}

func countElements(startNode: Node?) -> Int {
    var count = 0
    var currentNode = startNode
    while let curNode = currentNode {
        count += 1
        currentNode = curNode.next
    }

    return count
}