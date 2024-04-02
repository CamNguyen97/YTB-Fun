class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :url
      t.string :title
      t.references :shared_by, foreign_key: { to_table: :users }
      t.text :description
      t.timestamps
    end
  end
end
