-- Created Using Intellij IDEA
-- Autor: Aniket Pandey
-- Date: 29/12/17
-- Time: 12:02 AM
--

wordLength = arg[1]
queries = tostring(arg[2])
queryLength = #queries

mainTable = {}

if arg[2] == nil then
    print("Usage: lua main.lua <word-length> <allowed-characters>\n")
end

-- Convert character query to a table form
wordTable = {}
queries:gsub(".",function(c) table.insert(wordTable,c) end)

-- Number of possible words
maxCombo = math.pow(queryLength, wordLength)


-- Insert combinations in the Main Table
for i=0, math.huge do

    -- Counting table length
    local count = 0
    for _ in pairs(mainTable) do
        count = count + 1
    end

    -- We have all possible combinations
    if count == maxCombo then
        print("Wordlist Completed, writing to file \'words.txt\'")

        -- Write the words to a a file
        local wordlist = io.open("words.txt", "a")

        io.output(wordlist)
        io.write(string.format("Words generated for length %d and characters \'%s\'\n", wordLength, queries))

        for _, value in pairs(mainTable) do
            io.write(value, "\n")
        end
        io.write("\n\n")
        io.close(wordlist)

        --os.execute("cat words.txt")

        break
    else

        -- Chose any 'wordlength' characters from wordTable
        local tempQuery = ''
        math.randomseed(os.time())
        for i=1, wordLength do
            local letter = math.random(queryLength)
            tempQuery = tempQuery .. queries:sub(letter,letter)
        end

        -- Check if tempQuery is in mainTable or not
        local condition = false
        for _, value in pairs(mainTable) do
            if tempQuery == value then
                condition = true; break
            end
        end

        -- Insert the value to mainTable
        if condition == false then
            print(tempQuery)
            table.insert(mainTable, tempQuery)
        end

    end

end