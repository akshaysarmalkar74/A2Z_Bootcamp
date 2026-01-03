// O(n) Time / O(n) Space
func printOneToN(num: Int) {
    printOneToNHelper(num: num, counter: 1)
}

func printOneToNHelper(num: Int, counter: Int) {
    guard counter <= num else { return }
    print(counter)
    printOneToNHelper(num: num, counter: counter + 1)
}

printOneToN(num: 10)