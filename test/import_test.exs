defmodule ImportTest do
  use ExUnit.Case
  doctest Import

  test "format product into string" do
    assert Import.formatProduct(
      %{"categories" => ["Customer Service", "Call Center"], "title" => "Freshdesk", "twitter" => "@freshdesk"}
    ) == "categories: Customer Service,Call Center title: Freshdesk twitter: @freshdesk "
  end
end
