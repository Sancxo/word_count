filename = IO.gets("File to count the words from: ") |> String.trim()

_words =
  File.read!(filename)
  |> String.split(~r{(\\n|[^\w'])+})
  # this anonymous function is necessary to remove the empty element at the end of the list
  |> Enum.filter(fn x -> x != "" end)
  # |> IO.inspect
  |> Enum.count()
  |> IO.puts()
