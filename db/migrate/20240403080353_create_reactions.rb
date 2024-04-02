class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
