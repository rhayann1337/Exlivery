defmodule Exlivery.Users.UserTest do
  alias Exlivery.Users.User
  import Exlivery.Factory
  use ExUnit.Case

  describe "build/5" do
    test "when return all params are valid" do
      {:ok, response} = User.build("rhay", "rhay@mail.com", "123456789", 20, "rua")

      expected_response = build(:user)

      assert response == expected_response
    end

    test "should return an error, because the age are lower than 18" do
      {result, _reason} = User.build("rhay", "rhay@mail.com", "123456789", 10, "rua")

      assert result == :error
    end
  end
end
