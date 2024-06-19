import UIKit

var arr = [256741038, 623958417, 467905213, 714532089, 938071625]

func minMaxSum(arr: [Int]) {
  var minSum = 0
  var maxSum = 0
  
  if arr.count > 0 {
    for i in 0..<arr.count {
      var array = arr
      array.remove(at: i)
      let sum = array.reduce(0, +)
      
      if maxSum == 0 && minSum == 0 {
        maxSum = sum
        minSum = sum
      } else if sum < minSum {
        minSum = sum
      } else if sum > maxSum {
        maxSum = sum
      }
    }
  }
  
  print("\(minSum) \(maxSum)") // TC: O(n2), SC: O(n)
}

minMaxSum(arr: arr)

// MARK: - By sorting of an array

func minMaxSumBySortingMain(arr: [Int]) {
  let sortedArray = arr.sorted()
  let minSum = sortedArray[..<(arr.count - 1)].reduce(0, +)
  let maxSum = sortedArray[1...].reduce(0, +)
  print("\(minSum) \(maxSum)") // TC: O(n log n), SC: O(n)
}

minMaxSumBySortingMain(arr: arr)

// MARK: - Using Min, max

func minMaxSumByUsingMinMax(arr: [Int]) {
  guard arr.count > 1 else {
    return
  }
  
  let sum = arr.reduce(0, +)
  let min = arr.min()
  let max = arr.max()
  
  print("\(sum - (max ?? 0)) \(sum - (min ?? 0))") //TC: O(n), SC: O(n)
}

minMaxSumByUsingMinMax(arr: arr)

// MARK: Using Int min, max

func minMaxSumUsingIntMinMax(arr: [Int]) {
  guard arr.count > 1 else {
    return
  }
  
  var total = 0
  var min = Int.max
  var max = Int.min
  print(min, max)
  
  for num in arr {
    total += num
    
    if num < min {
      min = num
    }
    
    if num > max {
      max = num
    }
  }
  
  print("\(total - max) \(total - min)")
}

minMaxSumUsingIntMinMax(arr: arr)
