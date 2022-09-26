defmodule Exlivery.Users.User do
  @keys [:address, :name, :email, :cpf, :age]
  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf, age, address) when age >= 18 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       address: address,
       name: name,
       email: email,
       cpf: cpf,
       age: age
     }}
  end

  def build(_name, _email, _cpf, _age, _address), do: {:error, "Invalir params"}
end
