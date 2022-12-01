import std/strutils
import aoc

const
    day = 1
    year = 2021

var
  input:seq[string] = getInput(day, year)
  count = 0

discard input.pop()

for index, value in input:
  var c = parseInt(value)
  if index != 0 and c > parseInt(input[index - 1]):
    count += 1

echo $count
