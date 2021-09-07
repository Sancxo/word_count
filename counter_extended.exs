filename = IO.gets(~s{File to count the words from: (type "h" for help) }) |> String.trim()

if(filename == "h") do
    IO.puts """
Usage: [filename] -[flags]
Flags
-l     displays line count, no empty lines
-L     displays every lines count (included break lines)
-c     displays character count, no spaces or break lines
-C     displays character count
-w     displays word count, no special characters (default)
-W     displays word count with special characters

Multiple flags may be used. Example usage to display line and character count:
somefile.txt -lc

"""

else
    parts = String.split(filename, "-")
    filename = List.first(parts) |> String.trim

    flags = case Enum.at(parts, 1) do
        nil -> ["w"] #if there is no flag, "-w" will be the default value
        chars -> String.split(chars, "") |> Enum.filter(fn x -> x != "" end)
    end

    body = File.read!(filename)
    lines = String.split(body, ~r{(\r\n|\n|\r)+})
    lines_with_break = String.split(body, ~r{(\r\n|\n|\r)})
    words = 
        String.split(body, ~r{(\\n|[^\w'])+})
        |> Enum.filter(fn x -> x != "" end)
    # words_with_spec = 
    #     String.split(body, ~r{[^\w']+})
    #     |> Enum.filter(fn x -> x != "" end)
    #     |> IO.inspect
    chars = String.split(body, "") |> Enum.filter(fn x -> x != "" && x != " " end)
    chars_with_spaces = String.split(body, "") |> Enum.filter(fn x -> x != "" end)

    Enum.each(flags, fn flag -> 
        case flag do
            "l" -> IO.puts("Number of lines without break lines: #{Enum.count(lines)}")
            "L" -> IO.puts("Total amount of lines: #{Enum.count(lines_with_break)}")
            "w" -> IO.puts("Number of words without special characters: #{Enum.count(words)}")
            # "W" -> IO.puts("Total amount of words: #{Enum.count(words_with_spec)}")
            "c" -> IO.puts("Number of chars without spaces: #{Enum.count(chars)}")
            "C" -> IO.puts("Total amount of chars with spaces: #{Enum.count(chars_with_spaces)}")
            _ -> nil
        end
    end)
end