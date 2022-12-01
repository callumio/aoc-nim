import std/httpclient
import std/rdstdin

proc getInputFromAOC*(day: int, year: int) : string =
  var client = newHttpClient()
  let cookieFile = open("cookie.txt")
  defer: cookieFile.close()
  client.headers = newHttpHeaders({ "cookie": cookie_file.readLine() })
  return client.getContent("https://adventofcode.com/" & $year & "/day/" & $day & "/input")

proc getInput*(day: int, year: int, network: bool = true) : string =
  if network:
    return getInputFromAOC(day, year)

