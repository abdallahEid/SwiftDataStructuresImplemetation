import Foundation

// MARK:- Node
public class Node {
    public var value: Int
    public var next: Node?
    
    public init(value: Int) {
        self.value = value
    }
}

// MARK:- Linked List
public class LinkedList {
    
    // MARK: - Properties
    public var head: Node?
    
    public init(head: Node?) {
        self.head = head
    }
    
    // MARK: - Append
    public func append(_ node: Node) {
        guard let head = head else {
            return
        }
        
        var current = head
        
        while let next = current.next {
            current = next
        }
        
        current.next = node
    }
    
    // MARK: - Retrieve
    public func getNode(atPosition position: Int) -> Node? {
        
        guard let head = head else {
            return nil
        }
        
        if position < 1 {
            return nil
        }
        
        var index = 1
        var current: Node? = head
        
        while index < position {
            current = current?.next
            if current == nil {
                break
            }
            
            index += 1
        }
        
        return current
    }
    
    // MARK: - Insertion
    public func insertNode(_ node: Node, at position: Int) {
        
        if let nodeAtThePosition = getNode(atPosition: position) {
            let previousNodeAtThePosition = getNode(atPosition: position - 1)
            node.next = nodeAtThePosition
            previousNodeAtThePosition?.next = node
        } else {
            print("Out of range")
        }
    }
    
    // MARK: - Deletion
    public func deleteNode(withValue value: Int) {
        
        var current: Node?
        
        if let headValue = head?.value{
            if headValue == value {
                head = head?.next
                return
            } else {
                current = head
            }
        }
        
        while let next = current?.next {
            if next.value == value {
                current?.next = next.next
                break
            }
        }
    }
    
    // MARK: - Has Cycle?
    public func hasCycle(_ head: Node?) -> Bool {
        
//        guard let head = head else {
//            return false
//        }
        
//        var visitedNodes = [Node?]()
//        var current = head
//        visitedNodes.append(head)
//        while let next = current.next {
//            if visitedNodes.first(where: { $0 === next }) != nil{
//                return true
//            }
//            visitedNodes.append(next)
//            current = next
//        }
//
//        return false
        
        // MARK: - Another Solution
        guard let head = head, let next = head.next else {
            return false
        }
        var slow: Node? = head //start:head; speed: 1
        var fast: Node? = next //start:next; speed: 2
        while slow !== fast {
            if slow == nil || fast == nil {
                return false
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return true
    }
}
