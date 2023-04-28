defmodule Sms.ManagementFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sms.Management` context.
  """

  @doc """
  Generate a store.
  """
  def store_fixture(attrs \\ %{}) do
    {:ok, store} =
      attrs
      |> Enum.into(%{
        identifier: 42,
        location: "some location"
      })
      |> Sms.Management.create_store()

    store
  end
end
