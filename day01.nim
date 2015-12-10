import strutils

# Part 1

proc concise(file: File): int =
  let input = file.readAll
  input.count('(') - input.count(')')

proc efficient(file: File): int =
  while not endOfFile file:
    case readChar file
    of '(': inc result
    of ')': dec result
    else: discard

#echo stdin.concise
#echo open("day01.input").concise
#echo open("day01.input").efficient

# Part 2

proc part2(file: File): tuple[total, pos: int64] =
  while not endOfFile file:
    case readChar file
    of '(': inc result.total
    of ')': dec result.total
    else: discard

    if result.pos == 0 and result.total == -1:
      result.pos = getFilePos file

echo open("day01.input").part2 # (total: 232, pos: 1783)
