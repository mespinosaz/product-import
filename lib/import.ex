defmodule Import do
  def main(args) do
    type = Enum.at(args,0) 
    filepath = Enum.at(args,1)
    mapContent(type, filepath) |> importProducts
  end

  defp mapContent("capterra", filepath) do
    [ document | _ ] = :yamerl_constr.file(filepath)
    document
  end

  defp mapContent("softwareadvice", filepath) do
    filepath |> File.read! |> Poison.Parser.parse! |> Map.get("products")
  end

  defp importProducts(products) do
    Enum.map products, fn product ->
      p = Enum.reduce(product, "", fn {k,v}, acc -> "#{acc}#{k}: #{v} " end)
      IO.puts "Importing: #{p}"
    end
  end
end
