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
      p = formatProduct(product)
      IO.puts "Importing: #{p}"
    end
  end

  def formatProduct(product) do
    Enum.reduce(product, "", fn {k,v}, acc -> formatKey({k,v}, acc) end)
  end

  defp formatKey({k,v}, acc) when is_list(v) and not is_integer(hd(v)) do 
    formatKey({k, Enum.join(v, ",")}, acc)
  end

  defp formatKey({k,v}, acc) do 
    "#{acc}#{k}: #{v} "
  end
end
