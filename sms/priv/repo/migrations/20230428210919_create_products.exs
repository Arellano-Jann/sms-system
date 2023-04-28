defmodule Sms.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :vendor_name, :string
      add :wholesale_price, :float
      add :retail, :float
      add :count, :integer

      timestamps()
    end
  end
end
