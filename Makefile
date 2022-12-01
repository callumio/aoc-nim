NC=nim cpp
NFLAGS=-d:ssl -d:release -o=bin/

day=0
year=2022

build: y$(year)d$(day).nim
	$(NC) $(NFLAGS) $^

run: build
	./bin/y$(year)d$(day) 

createFile ./bin/createFile: createFile.nim
	$(NC) $(NFLAGS) $^

create: ./bin/createFile
	$^ $(year) $(day)

clean:
	rm -rf bin/ createFile &>/dev/null
