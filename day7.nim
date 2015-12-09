import strutils, sequtils, tables

proc part1(file: File): uint16 =
  var conns = initTable[string, seq[string]]()
  var vals  = initTable[string, uint16]()

  for line in lines file:
    let t = line.split(' ')
    conns[t[^1]] = t[0..^3]

  proc go(wire: string): uint16 =
    try: return uint16 parseInt wire
    except: discard

    if wire in vals: return vals[wire]

    let c = conns[wire]

    if c.len == 1:      result = go(c[0])
    elif c[0] == "NOT": result = not go(c[1])
    else:
      case c[1]
      of "AND":    result = go(c[0]) and go(c[2])
      of "OR":     result = go(c[0]) or  go(c[2])
      of "LSHIFT": result = go(c[0]) shl go(c[2])
      of "RSHIFT": result = go(c[0]) shr go(c[2])
      else: raise newException(ValueError, "Invalid operator " & c[1])

    vals[wire] = result

  result = go("a")

echo "Part 1: ", open("day7.input").part1

proc part2(file: File): uint16 =
  var conns = initTable[string, seq[string]]()
  var vals  = initTable[string, uint16]()
  vals["b"] = 956

  for line in lines file:
    let t = line.split(' ')
    conns[t[^1]] = t[0..^3]

  proc go(wire: string): uint16 =
    try: return uint16 parseInt wire
    except: discard

    if wire in vals: return vals[wire]

    let c = conns[wire]

    if c.len == 1:      result = go(c[0])
    elif c[0] == "NOT": result = not go(c[1])
    else:
      case c[1]
      of "AND":    result = go(c[0]) and go(c[2])
      of "OR":     result = go(c[0]) or  go(c[2])
      of "LSHIFT": result = go(c[0]) shl go(c[2])
      of "RSHIFT": result = go(c[0]) shr go(c[2])
      else: raise newException(ValueError, "Invalid operator " & c[1])

    vals[wire] = result

  result = go("a")

echo "Part 2: ", open("day7.input").part2
