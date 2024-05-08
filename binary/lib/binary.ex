defmodule Binary do
  def get_png_binary() do
    File.read(Path.join("lib", "chart.png"))
  end

  def get_jpg_binary() do
    File.read(Path.join("lib", "elixir_thingy.jpg"))
  end

  defguard is_png(file)
           when binary_part(file, 0, 8) == <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A>>

  defguard is_jpg(file)
           when binary_part(file, 0, 4) == <<0xFF, 0xD8, 0xFF, 0xEE>> or
                  binary_part(file, 0, 4) == <<0xFF, 0xD8, 0xFF, 0xDB>> or
                  binary_part(file, 0, 12) ==
                    <<0xFF, 0xD8, 0xFF, 0xE0, 0x00, 0x10, 0x4A, 0x46, 0x49, 0x46, 0x00, 0x01>>

  def type_from_binary(file_binary) when is_png(file_binary), do: {:ok, "image/png"}
  def type_from_binary(file_binary) when is_jpg(file_binary), do: {:ok, "image/jpg"}
  def type_from_binary(_other), do: {:error, "unknown"}
end
