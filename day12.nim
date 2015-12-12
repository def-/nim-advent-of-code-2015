import parseutils, json

proc part1(file: File): int =
  result = 0
  var i = 0
  var s = readAll(file)
  while i < s.len:
    var x = 0
    var j = i
    i += parseInt(s, x, i)
    result += x
    if i == j:
      inc i

echo "Part 1: ", open("day12.input").part1

proc part2(file: File): int =
  result = 0
  var i = 0
  var s = readAll(file)
  var j = parseJson(s)

  proc f(x: JsonNode): int =
    case x.kind
    of JArray:
      for y in x:
        result += f(y)
    of JObject:
      for y,z in x:
        if z.kind == JString and z.str == "red":
          return
      for y,z in x:
        result += f(z)
    of JInt:
      result = x.num.int
    else:
      discard

  result = f(j)

echo "Part 2: ", open("day12.input").part2
