defmodule EbooklyPhoenix.Repo.Migrations.CreateAuthors do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :first_name, :string
      add :last_name, :string

      timestamps()
    end

  end
end
