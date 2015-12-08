import md5

const code = "bgvyzdsv"

# Part 1

proc part1: int =
  for i in 1 .. int.high:
    if getMD5(code & $i)[0..4] == "00000":
      return i

#echo part1()

# Part 2

proc part2: int =
  for i in 1 .. int.high:
    if getMD5(code & $i)[0..5] == "000000":
      return i

echo part2()
