import std/httpclient
import std/strutils

const
    day = 1
    year = 2021

proc getInput() : string =
  var client = newHttpClient()
  let cookieFile = open("cookie.txt")
  defer: cookieFile.close()
  client.headers = newHttpHeaders({ "cookie": cookie_file.readLine() })
  return client.getContent("https://adventofcode.com/" & $year & "/day/" & $day & "/input")

var
  input = splitLines(getInput())
  count:int = 0

discard input.pop()

for index, value in input:
  var c = parseInt(value)
  if index != 0 and c > parseInt(input[index - 1]):
    count += 1

echo $count
