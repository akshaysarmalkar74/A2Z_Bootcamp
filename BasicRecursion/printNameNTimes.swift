// O(n) Time / O(n) Space
func printNameNTimes(name: String, num: Int) {
    guard num > 0 else { return }
    print(name)
    printNameNTimes(name: name, num: num - 1)
}

printNameNTimes(name: "Akshay", num: 5)