NC=nim cpp
NFLAGS=-d:ssl -d:release -o=bin/

day=0
year=2022

build: src/y$(year)d$(day).nim
	$(NC) $(NFLAGS) $^

run: build
	./bin/y$(year)d$(day) 

createFile ./bin/createFile: src/createFile.nim
	$(NC) $(NFLAGS) $^

create src/y$(year)d$(day).nim: ./bin/createFile
	$^ $(year) $(day)
	mv y$(year)d$(day).nim src/

clean:
	rm -rf bin/ &>/dev/null
