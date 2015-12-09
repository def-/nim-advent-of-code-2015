import strutils

proc part1(file: File): int =
  for line in lines file:
    var row = false
    for i in 0 ..< line.high:
      if line[i] == line[i+1]:
        row = true
        break

    if row and
       line.count({'a','e','i','o','u'}) >= 3 and
       "ab" notin line and
       "cd" notin line and
       "pq" notin line and
       "xy" notin line:
      inc result

echo "Part 1: ", open("day5.input").part1

proc part2(file: File): int =
  for line in lines file:
    var row = false
    for i in 0 .. line.high-3:
      for j in i+2 .. line.high-1:
        if line[i] == line[j] and line[i+1] == line[j+1]:
          row = true
          break

    var repeats = false
    for i in 0 .. line.high-2:
      if line[i+0] == line[i+2]:
        repeats = true
        break

    if row and repeats:
      inc result

echo "Part 2: ", open("day5.input").part2
