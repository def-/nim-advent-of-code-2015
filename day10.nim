import strutils, sequtils, tables, algorithm

var x = "1113122113"

for j in 1..50:
  var prev = x[0]
  var y = ""
  var count = 0
  for i, c in x:
    if c != prev:
      y.add($count)
      y.add x[i-1]
      count = 0
    inc count
    prev = c
  y.add($count)
  y.add x[^1]
  x = y

echo x.len
