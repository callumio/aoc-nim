import std/[strutils,sequtils,algorithm,sugar,times]
import aoc

const
  day = 1
  year = 2022

var
  input:string = getInput(day, year)
  output:seq[int]
let time = cpuTime()
output = split(input, "\n\n")[0..^2].mapIt(it.splitLines().mapIt(parseInt(it)).foldl(a+b)).sorted()[^3..^1]
echo "Time taken ", cpuTime()-time, "s"
echo $output[^1] & " " & $output.foldl(a+b)
