
// Set up some Nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)

// Start setting up a LinkedList
let ll = LinkedList(head: n1)
ll.append(n2)
ll.append(n3)

// Test getNode(atPosition:)
print(ll.head!.next!.next!.value) // Should print 3
print(ll.getNode(atPosition: 3)!.value) // Should also print 3

// Test insert
ll.insertNode(n4, at: 3)
print(ll.getNode(atPosition: 3)!.value) // Should print 4 now

// Test delete(withValue:)
ll.deleteNode(withValue: 1)
print(ll.getNode(atPosition: 1)!.value) // Should print 2 now
print(ll.getNode(atPosition: 2)!.value) // Should print 4 now
print(ll.getNode(atPosition: 3)!.value) // Should print 3


ll.hasCycle(n1)
