// O(n) Time / O(n) Space
func printNToOne(num: Int) {
    printNToOneHelper(num: num, counter: 1)
}

func printNToOneHelper(num: Int, counter: Int) {
    guard counter <= num else { return }
    printNToOneHelper(num: num, counter: counter + 1)
    print(counter)
}

// Alternative simpler version
// O(n) Time / O(n) Space
func printNToOne2(num: Int) {
    guard num > 0 else { return }
    print(num)
    printNToOne2(num: num - 1)
}

printNToOne(num: 10)