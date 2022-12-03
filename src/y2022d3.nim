import std/[strutils,sequtils]
import aoc

const
    day = 3
    year = 2022

var
  input:seq[string] = getInput(day, year).splitLines()[0..^2]

proc splitR(s:string) : seq[string] =
    var l:int = ((s.len-1) div 2) 
    @[s[0..l], s[(l+1)..^1], s[(l+1)..^1]]

proc findCommon(s:seq[string]) : int =
    for i in s[0].items:
      if i in toSeq(s[1].items) and i in toSeq(s[2].items):
        var c = ord(i)
        if i.isLowerAscii:
          c -= 96
        if i.isUpperAscii:
          c -= 38
        return c

echo $input.mapIt(splitR(it)).mapIt(findCommon(it)).foldl(a+b)
echo $input.distribute(input.len div 3,false).mapIt(findCommon(it)).foldl(a+b)
