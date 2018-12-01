defmodule EbooklyPhoenix.Repo.Migrations.CreateBookshops do
  use Ecto.Migration

  def change do
    create table(:bookshops) do
      add :name, :string

      timestamps()
    end

  end
end
