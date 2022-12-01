import std/strutils
import os

if paramCount() != 2:
  echo "useage: ./createFile <year> <day>"
  1.quit()

let year = paramStr(1)
let day = paramStr(2)

let templateFile = open("day.nim.template")
let dayFile = open("y" & year & "d" & day & ".nim", fmWrite)

var c:string = templateFile.readAll()
c = c.replace("$year$", year)
c = c.replace("$day$", day)

dayfile.write(c)

dayFile.close()
templateFile.close()
