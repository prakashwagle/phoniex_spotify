defmodule PhoniexSpotify do
  @moduledoc """
  PhoniexSpotify keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias PhoniexSpotify.Task
  @tasks MapSet.new();
  def add(task) when is_map(task) do
    put_in(@tasks, Enum.into([task], :id))
  end

  def delete(%Task{id: id}) do
    @tasks = MapSet.delete(@tasks, id)
  end

  def list(), do: MapSet.to_list(@tasks)
end
