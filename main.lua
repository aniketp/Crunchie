-- Created Using Intellij IDEA
-- Autor: Aniket Pandey
-- Date: 29/12/17
-- Time: 12:02 AM
--

local wordLength = arg[1]
local queries = tostring(arg[2])
local queryLength = #queries

local mainTable = {}

printAllWords = function(wordTable, prefix, queryLength, wordLength)
    if wordLength == 0 then
        print(prefix)
    end

    for i=1, queryLength do
        prefix = prefix .. tostring(wordTable[i])
        printAllWords(wordTable, prefix, queryLength, wordLength-1)
    end
end

driver = function()
    -- Convert character query to a table form
    local wordTable = {}
    queries:gsub(".",function(c) table.insert(wordTable,c) end)

    -- Number of possible words
    local maxCombo = math.pow(queryLength, wordLength)


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

                -- Use this code after recursion issue is fixed
                -- local prefix = ''
                -- printAllWords(wordTable, prefix, queryLength, wordLength)
            end

        end

    end
end

if arg[2] == nil then
    print("Usage: lua main.lua <word-length> <allowed-characters>\n")
elseif #arg[2] > 4 then
    io.write("Input query too large, can cause performance issues\nDo you want to continue?(Y/n)")
    local dec = io.read(); if (dec == '' or dec:lower() == 'y') then driver() else print("Program terminated")
    end
else
    driver()
end
