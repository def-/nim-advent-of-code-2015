import strutils

proc part1(file: File): int =
  for line in lines file:
    result += len line
    result -= len unescape line

echo "Part 1: ", open("day08.input").part1

proc part2(file: File): int =
  for line in lines file:
    result += len escape line
    result -= len line

echo "Part 2: ", open("day08.input").part2
