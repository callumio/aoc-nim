import std/httpclient
import std/strutils

proc getInput*(day: int, year: int, sep: string = "") : seq =
  var client = newHttpClient()
  let cookieFile = open("cookie.txt")
  defer: cookieFile.close()
  client.headers = newHttpHeaders({ "cookie": cookie_file.readLine() })
  var input = client.getContent("https://adventofcode.com/" & $year & "/day/" & $day & "/input")
  if sep == "":
    return splitLines(input)
  else:
    return split(input, sep)
