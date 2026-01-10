class Node {
    var value: Int
    var next: Node?

    init(_ value: Int) {
        self.value = value
    }
}

func search(startNode: Node?, target: Int) -> Bool {
    var curNode = startNode
    while curNode != nil {
        if curNode?.value == target { return true }
        curNode = curNode?.next
    }

    return false
}