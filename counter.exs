filename = IO.gets("File to count the words from: ") |> String.trim()
user_choice = IO.gets(~s{What do you want to count ? ("lines" / "words" / "characters") }) |> String.trim

case user_choice do
    "lines" -> 
        _lines = 
            File.read!(filename)
            |> String.split("\n")
            |> Enum.filter(fn x -> x != "" end)
            |> Enum.count()
            |> IO.inspect()
            
    "words" -> 
        _words =
            File.read!(filename)
            |> String.split(~r{(\\n|[^\w'])+})
            # this anonymous function is necessary to remove the empty element at the end of the list
            |> Enum.filter(fn x -> x != "" end)
            # |> IO.inspect
            |> Enum.count()
            |> IO.puts()

    "characters" -> 
        _chars = 
            File.read!(filename)
            |> String.split(~r{(\\n|\s)+})
            |> Enum.filter(fn x -> x != "" end)
            |> Enum.map(fn element -> 
                String.split(element, "", trim: true) 
                |> Enum.count()
            end)
            |> Enum.sum()
            |> IO.inspect
            
end