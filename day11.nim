proc nextPW(current: string): string =
  result = current

  while true:
    var i = result.high
    while true: # Find next potential PW
      if result[i] < 'z':
        inc result[i]
        break
      else:
        for j in i .. result.high:
          result[j] = 'a'
        dec i

    # Filter out insecure PWs
    if 'i' in result or 'o' in result or 'l' in result:
      continue

    var found = 0
    i = 0
    while i < result.high:
      if result[i] == result[i+1]:
        inc found
        inc i
      inc i
    if found < 2:
      continue

    for i in 0 .. result.high-2:
      if int(result[i])+1 == int(result[i+1]) and
         int(result[i+1])+1 == int(result[i+2]):
        return # Secure PW found

let pw = nextPW("vzbxkghb")
echo "Part 1: ", pw
echo "Part 2: ", nextPW(pw)
