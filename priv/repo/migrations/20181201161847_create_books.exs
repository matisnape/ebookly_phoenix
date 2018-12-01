defmodule EbooklyPhoenix.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author_id, references(:authors, on_delete: :nothing)
      add :bookshop_id, references(:bookshops, on_delete: :nothing)

      timestamps()
    end

    create index(:books, [:author_id])
    create index(:books, [:bookshop_id])
  end
end
