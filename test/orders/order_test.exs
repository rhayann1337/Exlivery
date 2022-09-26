defmodule Exlivery.Orders.OrderTest do
  alias Exlivery.Orders.Order
  import Exlivery.Factory
  use ExUnit.Case

  describe "build/2" do
    test "should return all valid params" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Sushi",
          category: :japonesa,
          unity_price: Decimal.new("35.5"),
          quantity: 1
        )
      ]

      {:ok, response} = Order.build(user, items)

      expected_response = build(:order)

      assert response == expected_response
    end

    test "should return an error, list items is empty" do
      user = build(:user)
      items = []
      {result, _reason} = Order.build(user, items)

      assert result == :error
    end

    test "should return an error, user is empty" do
      user = nil

      items = [
        build(:item),
        build(:item,
          description: "Sushi",
          category: :japonesa,
          unity_price: Decimal.new("35.5"),
          quantity: 1
        )
      ]

      {result, _reason} = Order.build(user, items)

      assert result == :error
    end
  end
end
