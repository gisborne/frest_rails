class AddRelations < ActiveRecord::Migration
  def change
    create_table :relations, id: :uuid do |t|
      t.string :name
      t.jsonb :fields
    end
  end
end