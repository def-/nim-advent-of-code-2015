import sets

type Pos = tuple[x, y: int]

# Part 1

proc part1(file: File): int =
  var
    grid = initSet[Pos]()
    pos: Pos

  grid.incl((0,0))

  while not endOfFile file:
    case file.readChar
    of '>': inc pos.x
    of '<': dec pos.x
    of '^': inc pos.y
    of 'v': dec pos.y
    else: discard

    grid.incl pos

  result = card grid

echo "Part 1: ", open("day3.input").part1

proc part2(file: File): int =
  var
    grid = initSet[Pos]()
    pos: array[2, Pos]
    i: range[0..1]

  grid.incl((0,0))

  while not endOfFile file:
    case file.readChar
    of '>': inc pos[i].x
    of '<': dec pos[i].x
    of '^': inc pos[i].y
    of 'v': dec pos[i].y
    else: discard

    grid.incl pos[i]
    i = (i + 1) mod 2

  result = card grid

echo "Part 2: ", open("day3.input").part2
