## Crunchie

```bash
   ____                       _     _      
  / ___|_ __ _   _ _ __   ___| |__ (_) ___ 
 | |   | '__| | | | '_ \ / __| '_ \| |/ _ \
 | |___| |  | |_| | | | | (__| | | | |  __/
  \____|_|   \__,_|_| |_|\___|_| |_|_|\___|
  
```

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
```
Check the contents of `words.txt` 
```bash
 $cat words.txt
 Words generated for length 3 and characters 'ab'
 abb
 aab
 aba
 baa
 bbb
 aaa
 bab
 bba
```



