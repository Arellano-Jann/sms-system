defmodule Sms.Items.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sms.Management.Store

  schema "products" do
    field :count, :integer
    field :name, :string
    field :retail, :float
    belongs_to :store, Store
    field :wholesale_price, :float

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :wholesale_price, :retail, :count])
    |> validate_required([:name, :wholesale_price, :retail, :count])
    # |> cast(attrs, [:name, :store_id, :wholesale_price, :retail, :count])
    # |> validate_required([:name, :store_id, :wholesale_price, :retail, :count])
  end
end
