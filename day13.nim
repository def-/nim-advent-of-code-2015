import strutils, tables, algorithm

proc solve(file: File): int =
  var t = initTable[(string,string), int]()
  var all = newSeq[string]()
  for line in lines file:
    var s = line.split(" ")
    var x = s[3].parseInt
    if s[2] == "lose":
      x = -x
    t[(s[0],s[^1][0..^2])] = x
    if s[0] notin all:
      all.add s[0]

  while nextPermutation(all):
    var tmp = 0
    for j in 0..all.high:
      var i = (j + all.len - 1) mod all.len
      var k = (j + 1) mod all.len
      tmp += t[(all[j],all[i])]
      tmp += t[(all[j],all[k])]
    if tmp > result:
      result = tmp

echo open("day13-part1.input").solve
echo open("day13-part2.input").solve
