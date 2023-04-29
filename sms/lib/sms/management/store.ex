defmodule Sms.Management.Store do
  # defstruct id: nil, last_name: nil, first_name: nil, hire_date: nil, department: nil

  use Ecto.Schema
  import Ecto.Changeset

  schema "stores" do
    field :identifier, :integer
    field :location, :string
    field :product_id, :id

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :identifier])
    |> validate_required([:location, :identifier])
  end
end
