import strutils, sequtils, algorithm

# Part 1

proc part1(file: File): int64 =
  for line in lines file:
    let x = line.split('x').map(parseInt).sorted(cmp)
    assert x.len == 3
    result += 3*x[0]*x[1] + 2*x[1]*x[2] + 2*x[0]*x[2]

#echo open("day2.input").part1

# Part 2

proc part2(file: File): tuple[wrapper, ribbon: int64] =
  for line in lines file:
    let x = line.split('x').map(parseInt).sorted(cmp)
    assert x.len == 3
    result.wrapper += 3*x[0]*x[1] + 2*x[1]*x[2] + 2*x[0]*x[2]
    result.ribbon += 2*x[0] + 2*x[1] + x[0]*x[1]*x[2]

echo open("day2.input").part2 # (wrapper: 1586300, ribbon: 3737498)
