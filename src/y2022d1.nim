import std/[strutils,sequtils,algorithm]
import aoc

const
  day = 1
  year = 2022

var
  input:seq[string] = getInput(day, year, sep="\n\n")[0..^2]
  output:seq[int]

output = input.mapIt(it.splitLines().mapIt(parseInt(it)).foldl(a+b)).sorted()[^3..^1]
echo $output[^1] & " " & $output.foldl(a+b)
