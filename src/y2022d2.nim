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
  total = (0, 0)

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

proc getScore1(score:int, score2:int) : int =
    var winloss = 0
    if score == score2:
      winloss = 1
    if score == (score2 + 1) mod 3:
      winloss = 0
    if score == (score2 + 2) mod 3:
      winloss = 2
    return (score2 mod 3) + 1 + winloss * 3

proc getScore2(score:int, score2:int) : int =
    return ((score + ((score2 + 1) mod 3) + 1) mod 3) + 1 + (score2 * 3)

proc getScores(moves:seq[string]) : (int, int) =
    var score:int = ord(translateInput(moves[0]))
    var score2:int = ord(translateInput(moves[1]))
    return (getScore1(score, score2), getScore2(score, score2))

let time = cpuTime()

for i in input.splitLines().mapIt(it.splitWhitespace())[0..^2].mapIt(getScores(it)):
  total[0] += i[0]
  total[1] += i[1]

echo "Task 1 and 2 ", $total

echo "Time taken ", cpuTime()-time, "s"
