defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory() do
    %User{
      name: "rhay",
      email: "rhay@mail.com",
      cpf: "123456789",
      address: "rua",
      age: 20
    }
  end

  def item_factory do
    %Item{
      description: "pizza",
      category: :pizza,
      unity_price: Decimal.new("35.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "rua",
      items: [
        build(:item),
        build(:item,
          description: "Sushi",
          category: :japonesa,
          unity_price: Decimal.new("35.5"),
          quantity: 1
        )
      ],
      total_price: Decimal.new("35.50"),
      user_cpf: "123456789"
    }
  end
end
