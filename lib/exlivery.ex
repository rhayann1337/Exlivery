defmodule Exlivery do
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  defdelegate create_or_update_user(params), to: CreateOrUpdate, as: :call

  def start_agents do
    UserAgent.start_link(%{})
  end

  def hello do
    :world
  end
end
