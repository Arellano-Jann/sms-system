defmodule Sms.Items.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :count, :integer
    field :name, :string
    field :retail, :float
    field :vendor_name, :string
    field :wholesale_price, :float

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :vendor_name, :wholesale_price, :retail, :count])
    |> validate_required([:name, :vendor_name, :wholesale_price, :retail, :count])
  end
end
