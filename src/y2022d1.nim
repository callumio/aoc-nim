import std/strutils
import std/sequtils
import aoc

const
    day = 1
    year = 2022

var
  input:seq[string] = getInput(day, year)
  output:seq[int]
  sum = 0

for index, val in input:
  if val == "":
    output.add(sum)
    sum = 0
  else:
    sum += parseInt(val)

sum = 0

echo "Task 1"
echo $output.max()

for i in 1..3:
  sum += output.max()
  output.delete(output.maxIndex())

echo "Task 1"
echo $sum
