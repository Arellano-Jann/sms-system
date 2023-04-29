defmodule Sms.Management.Store do
  # defstruct id: nil, last_name: nil, first_name: nil, hire_date: nil, department: nil

  use Ecto.Schema
  import Ecto.Changeset

  alias Sms.Items.Product

  schema "stores" do
    field :identifier, :integer
    field :location, :string
    has_many :products, Product

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:location, :identifier])
    |> validate_required([:location, :identifier])
  end
end
