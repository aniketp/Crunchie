## Crunchie

Love Brute-forcing? Cool! <br>
Got any wordlist? No?

Crunchie is a tiny impersonation of Crunch, a wordlist-generator for Kali-Linux.

**NOTE**: Current version uses highly inefficient, randomized algorithm and can over-utilize the CPU. Better use the original generator 
for any projects.

## Usage
Install Lua Interpreter version 5.2
```bash
 $sudo apt-get install lua5.2
```

Clone the repository and execute the generator
```bash
 $git clone git@github.com:aniketp41/Crunchie.git crunchie && cd crunchie
 $lua main.lua <word-length> <allowed-characters>
```

### Example
```bash
 $lua 3 ab

 Output:
 Wordlist Completed, writing to file 'words.txt'
 Words generated for length 3 and characters 'ab'
```
 
```bash
 $cat words.txt
 abb
 aab
 aba
 baa
 bbb
 aaa
 bab
 bba
```



