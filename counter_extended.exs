filename = IO.gets(~s{File to count the words from: (type "h" for help) }) |> String.trim()

if(filename == "h") do
    IO.puts """
Usage: [filename] -[flags]
Flags
-l     displays line count
-c     displays character count
-w     displays word count (default)
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
    lines = String.split(body, ~r{(\n\r|\n|\r)})
    words = 
        String.split(body, ~r{(\\n|[^\w'])+})
        |> Enum.filter(fn x -> x != "" end)
    chars = String.split(body, "") |> Enum.filter(fn x -> x != "" end)

    Enum.each(flags, fn flag -> 
        case flag do
            "l" -> IO.puts("Number of lines: #{Enum.count(lines)}")
            "w" -> IO.puts("Number of words: #{Enum.count(words)}")
            "c" -> IO.puts("Number of chars: #{Enum.count(chars)}")
            _ -> nil
        end
    end)
end