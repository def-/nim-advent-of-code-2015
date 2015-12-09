import strutils, sequtils, tables, algorithm

proc part1(file: File): int =
  result = int.high

  var
    table = initTable[(string, string), int]()
    all = newSeq[string]()

  for line in lines file:
    let t = line.split(" ")
    if t[0] notin all: all.add t[0]
    if t[2] notin all: all.add t[2]
    table[(t[0], t[2])] = parseInt t[4]
    table[(t[2], t[0])] = parseInt t[4]

  sort(all, cmp)

  while nextPermutation all:
    var sum = 0
    for i in 0 ..< all.high:
      sum += table[(all[i], all[i+1])]
    if sum < result:
      result = sum

echo "Part 1: ", open("day09.input").part1

proc part2(file: File): int =
  var
    table = initTable[(string, string), int]()
    all = newSeq[string]()

  for line in lines file:
    let t = line.split(" ")
    if t[0] notin all: all.add t[0]
    if t[2] notin all: all.add t[2]
    table[(t[0], t[2])] = parseInt t[4]
    table[(t[2], t[0])] = parseInt t[4]

  sort(all, cmp)

  while nextPermutation all:
    var sum = 0
    for i in 0 ..< all.high:
      sum += table[(all[i], all[i+1])]
    if sum > result:
      result = sum

echo "Part 2: ", open("day09.input").part2
