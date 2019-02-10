defmodule ImportTest do
  use ExUnit.Case
  doctest Import

  test "format product into string" do
    assert Import.formatProduct(
      %{"categories" => ["Customer Service", "Call Center"], "title" => "Freshdesk", "twitter" => "@freshdesk"}
    ) == "categories: Customer Service,Call Center title: Freshdesk twitter: @freshdesk "
  end

  test "import capterra file" do
    assert Import.mapContent("capterra", "feed-products/capterra.yaml") == [
      %{
        'name' => 'GitHub',
        'tags' => 'Bugs & Issue Tracking,Development Tools',
        'twitter' => 'github'
      }, 
      %{
        'name' => 'Slack',
        'tags' => 'Instant Messaging & Chat,Web Collaboration,Productivity',
        'twitter' => 'slackhq'
      }, 
      %{
        'name' => 'JIRA Software',
        'tags' => 'Project Management,Project Collaboration,Development Tools',
        'twitter' => 'jira'
      }]
  end
  test "import softwareadvice file" do
    assert Import.mapContent("softwareadvice", "feed-products/softwareadvice.json") == [
      %{
        "categories" => [
          "Customer Service", 
          "Call Center"
        ], 
        "title" => "Freshdesk", 
        "twitter" => "@freshdesk"
      }, 
      %{
        "categories" => [
          "CRM",
          "Sales Management"
        ],
        "title" => "Zoho"
      }
    ]
  end
end
