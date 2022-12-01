import std/httpclient
import std/strutils

proc getInput*(day: int, year: int) : seq =
  var client = newHttpClient()
  let cookieFile = open("cookie.txt")
  defer: cookieFile.close()
  client.headers = newHttpHeaders({ "cookie": cookie_file.readLine() })
  return splitLines(client.getContent("https://adventofcode.com/" & $year & "/day/" & $day & "/input"))
