import strutils, sequtils

type Pos = tuple[x,y: int]

proc part1(file: File): int =
  var grid: array[1000, array[1000, bool]]

  for line in lines file:
    let
      tokens = line.split(' ')
      a = tokens[^3].split(',').map(parseInt)
      b = tokens[^1].split(',').map(parseInt)

    for i in a[0] .. b[0]:
      for j in a[1] .. b[1]:
        if tokens[0] == "toggle":
          grid[i][j] = not grid[i][j]
        elif tokens[0] == "turn" and tokens[1] == "on":
          grid[i][j] = true
        elif tokens[0] == "turn" and tokens[1] == "off":
          grid[i][j] = false
        else:
          assert false

  for line in grid:
    for value in line:
      if value:
        inc result

echo "Part 1: ", open("day06.input").part1

proc part2(file: File): int =
  var grid: array[1000, array[1000, int]]

  for line in lines file:
    let
      tokens = line.split(' ')
      a = tokens[^3].split(',').map(parseInt)
      b = tokens[^1].split(',').map(parseInt)

    for i in a[0] .. b[0]:
      for j in a[1] .. b[1]:
        if tokens[0] == "toggle":
          grid[i][j] += 2
        elif tokens[0] == "turn" and tokens[1] == "on":
          inc grid[i][j]
        elif tokens[0] == "turn" and tokens[1] == "off":
          grid[i][j] = max(0, grid[i][j] - 1)
        else:
          assert false

  for line in grid:
    for value in line:
      result += value

echo "Part 2: ", open("day06.input").part2
