import std/[strutils,sequtils,times]
import aoc

const
    day = 2
    year = 2022

type
  RPS = enum
    Rock, Paper, Scissors

var
  input:string = getInput(day, year)
  output:seq[seq[string]]

proc translateInput(s:string) : RPS =
    case s:
      of "X":
        return RPS.Rock
      of "A":
        return RPS.Rock
      of "Y":
        return RPS.Paper
      of "B":
        return RPS.Paper
      of "Z":
        return RPS.Scissors
      of "C":
        return RPS.Scissors

proc getScore1(moves:seq[string]) : int =
    var score:int = ord(translateInput(moves[0]))
    var score2:int = ord(translateInput(moves[1]))
    var winloss = 0
    if score == score2:
      winloss = 1
    if score == (score2 + 1) mod 3:
      winloss = 0
    if score == (score2 + 2) mod 3:
      winloss = 2
    return (score2 mod 3) + 1 + winloss * 3

proc getScore2(moves:seq[string]) : int =
    var score:int = ord(translateInput(moves[0]))
    var winloss:int = ord(translateInput(moves[1]))
    score += ((winloss + 1) mod 3) + 1
    (score mod 3) + 1 + (winloss * 3)


let time = cpuTime()
output = input.splitLines().mapIt(it.splitWhitespace())[0..^2]
echo "Task 1 ", $output.mapIt(getScore1(it)).foldl(a+b)
echo "Task 2 ", $output.mapIt(getScore2(it)).foldl(a+b)
echo "Time taken ", cpuTime()-time, "s"