package main

import (
	"os"
	"log"
	"fmt"
	"bufio"
	"bytes"
	"io"
	"strings"
)

func readLines(path string) (lines []string, err error) {
    var (
        file *os.File
        part []byte
        prefix bool
    )
    if file, err = os.Open(path); err != nil {
        return
    }
    defer file.Close()

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

func slice_and_dice(s string, start int, end int) string {
	//fmt.Println(start, end, len(s))
	if((start + end) < len(s)) {
		return s[start:start+end]
	} else {
		return s[start:len(s)]
	}
}

func is_only_wildcards(s string) bool {
	for ii := 0; ii < len(s); ii++ {
		if(s[ii] != '*') {
			return false
		}
	}
	return true
}

func contains_wildcard(s string) bool {
	//fmt.Println(s)
	for j := 0; j < len(s) - 1; j++ {
		if(s[j] == '*' && s[j - 1] != '\\') {
			return true
		}
	}
	return false
}

func main() {
	lines, err := readLines(os.Args[1])
	if err != nil {
		log.Fatal(err)
        fmt.Println("Error: %s\n", err)
        return
    }
    for _, line := range lines {
    	stringArr := strings.Split(line, ",")
    	searchStr := stringArr[0]
    	//searchStrArr := strings.Split(searchStr, "")
    	searchee := stringArr[1]
    	//searcheeArr := strings.Split(searchee, "")
    	//len_searchee := len(searchee)
    	//match := false
    	for i := 0; i < len(searchStr); i++ {
    		//fmt.Println(slice_and_dice(searchStr, i, len(searchee)))
    		//fmt.Println(searchee)
    		if (slice_and_dice(searchStr, i, len(searchee)) == searchee) {
    			//match = true
    			fmt.Println("true")
    			break
    		}
    		if(is_only_wildcards(searchee)) {
    			fmt.Println("true")
    			break
    		}
    		if(contains_wildcard(searchee)) {
    			pos := strings.Index(searchee, "*")
    			found_end_wildcards := false
    			end_pos := pos+1
    			//if(line == "Stranger,tran*r") {
    			//	fmt.Println(pos, end_pos)
    			//}
    			for !found_end_wildcards {
    				if(end_pos >= len(searchee)) {
    					fmt.Println("false")
    					found_end_wildcards = false
    					break
    				} 
    				//fmt.Println(string(searchee[end_pos]))
    				if(searchee[end_pos] != '*') {
    					found_end_wildcards = true
    				} else {
    					end_pos++
    				}
    			}
    			if(found_end_wildcards == false) {
    				break
    			}
    			if(end_pos > len(searchee)) {
    					fmt.Println("false")
    					break	
    			} 
    			first_nonwildcard := searchee[end_pos]
    			//if(line == "Stranger,tran*r") {
    			//	fmt.Println(first_nonwildcard)
    			//}
    			searchStrEndPos := strings.Index(searchStr[i:], string(first_nonwildcard))
    			if(searchStrEndPos == -1) {
    				//match = false
    				fmt.Println("false")
    				break
    			} else {
    				//match = true
    				fmt.Println("true")
    				break
    			}
    		} else {
    			if((len(searchStr) - i) < len(searchee)) {
    				fmt.Println("false")	
    				break
    			}
    		}


    	}
    	
        //fmt.Println("searchStr %s\n", searchStr)
        //fmt.Println("searchee %s\n", searchee)
    }
}