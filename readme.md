For the word count, in a terminal: 
- Type `elixir word_count.exs` to launch the script.
- When asked, type the path of the file you want to count the words of. Ex : `word_count.exs` or `..\path\to\file.txt`.

For the evolved counter version (V2), in a terminal:
- Type `elixir counter.exs` to launch the script.
- When asked, type the path of the file you want to count the words of. Ex : `counter.exs` or `..\path\to\file.txt`.
- Select the counting type you want by typing `lines` to count the sum of lines (except blank lines) in the document, `words` to count the sum of the words (except break lines and special characters) or `characters` to count every characters in the document (except break lines and spaces).

For the final extended version (v3), in a terminal:
- Type `elixir counter_extended.exs` to launch the script.
- When asked, type the path of the file you want to count the words of. Ex : `counter.exs` or `..\path\to\file.txt` + the flags as explained below.
- Type `h` for help (you don't need to enter a file path).
- Type `-l` after the file path to count the lines (without the empty lines).
- Type `-L` after the file path to count all the lines (empty lines included).
- Type `-c` after the file path to count the characters (without the spaces and break lines).
- Type `-C` after the file path to count all the characters (spaces and break lines included).
- Type `-w` after the file path to count the words in the document (except special characters alone, ex: "=").
- You can stack the flags to have multiple results, ex: `-lLcCw` to receive all the results.