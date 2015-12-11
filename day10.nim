proc part1: int =
  var x = "1113122113"

  for round in 1..40:
    var
      y = ""
      prev = x[0]
      count = 0

    for i, c in x:
      if c != prev:
        y.add($count & x[i-1])
        count = 0
      inc count
      prev = c

    y.add($count & x[^1])
    x = y

  result = x.len

echo "Part 1: ", part1()

proc part2: int =
  var x = "1113122113"

  for round in 1..50:
    var
      y = ""
      prev = x[0]
      count = 0

    for i, c in x:
      if c != prev:
        y.add($count & x[i-1])
        count = 0
      inc count
      prev = c

    y.add($count & x[^1])
    x = y

  result = x.len

echo "Part 2: ", part2()
