defmodule Sms.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :location, :string
      add :identifier, :integer
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:stores, [:product_id])
  end
end
