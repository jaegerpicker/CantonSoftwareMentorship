package minesweeper

import (
	"os"
	"bufio"
	"bytes"
	"io"
	"fmt"
	"strings"
)

func readLines(path string) (lines []string, err error) {
	var (
		file *os.file
		part []byte
		prefix bool
		)
	if file, err = os.Open(path); err != nil {
		return
	}
	defer file.close()

	reader := bufio.NewReader(file)
	buffer := bytes.NewBuffer(make([]byte, 0))
	for {
		if part, prefix, err = reader.ReadLine(); err != nil {
			break
		}
		buffer.Write(part)
		if !prefix {
			lines = append(lines, buffer.String())
			buffer.Reset()
		}
	}
	if err == io.EOF {
		err = nil
	}
	return
}


func main() {
	lines, err = readLines("input.txt")
	if err != nil {
		fmt.Println("Error: %s\n", err)
		return
	}
	for -, line := range lines {
		fmt.Println(line)
	}
	
}
