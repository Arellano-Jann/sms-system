defmodule Sms.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sms.Items` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        count: 42,
        name: "some name",
        retail: 120.5,
        vendor_name: "some vendor_name",
        wholesale_price: 120.5
      })
      |> Sms.Items.create_product()

    product
  end
end
