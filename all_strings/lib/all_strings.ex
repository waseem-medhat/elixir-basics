defmodule AllStrings do
  @moduledoc """
  Some basic string manipulation shenanigans!
  """

  @doc """
  Returns the first non-whitespace character in the given `value`.
  ## Examples
    iex> AllStrings.first_letter("  walter white  ")
    "w"
  """
  def first_letter(value) do
    value
    |> String.trim()
    |> String.first()
  end

  @doc """
  Returns the first non-whitespace character in the given `value` in an intial
  form.
  ## Examples
    iex> AllStrings.initial("  walter white  ")
    "W."
  """
  def initial(value) do
    (value
     |> first_letter()
     |> String.capitalize()) <> "."
  end

  @doc """
  Returns an initial form of the given `value`
  ## Examples
    iex> AllStrings.initials("  walter white  ")
    "W.W."
  """
  def initials(full_name) do
    full_name
    |> String.split()
    |> Enum.map(fn word -> initial(word) end)
    |> Enum.join()
  end

  def customized_saucer(initials) do
    make_saucer()
    |> String.replace(
      "************************************************************",
      "****************** 󰈸 #{initials}'s SPACECRAFT 󰈸 *******************"
    )
  end

  defp make_saucer() do
    """


                        %%%%%%%%%%%%%%%%%%%%
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
      ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    ************************************************************
        ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
           ,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,,,,&&&,,,
                ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,

    """
  end
end
