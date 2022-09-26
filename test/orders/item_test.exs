defmodule Exlivery.Orders.ItemTest do
  alias Exlivery.Orders.Item
  import Exlivery.Factory
  use ExUnit.Case

  describe "build/4" do
    test "should return an item with all valid params" do
      {:ok, response} = Item.build("pizza", :pizza, 35.5, 1)

      expected_response = build(:item)

      assert response == expected_response
    end

    test "should return an error, category invalid" do
      result = Item.build("test banana", :tabs, 10, 1)

      assert result == {:error, "Invalid parameters"}
    end

    test "should return error, the quantity are lower than 0" do
      result = Item.build("test banana", :tabs, 10, -1)

      assert result == {:error, "Invalid parameters"}
    end
  end
end
