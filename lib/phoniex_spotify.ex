defmodule PhoniexSpotify do
  @moduledoc """
  PhoniexSpotify keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias PhoniexSpotify.Task
  @tasks MapSet.new();
  def add(tasks, task) when is_map(task) do
    MapSet.put(tasks, task)
  end

  def delete(tasks, task_id) do
    MapSet.delete(tasks, task_id)
  end

  def list(), do: MapSet.to_list(@tasks)
end
