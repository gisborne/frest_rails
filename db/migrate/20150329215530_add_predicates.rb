class AddPredicates < ActiveRecord::Migration
  def change
    create_table :predicates, id: :uuid  do |t|
      t.text :fn
      t.jsonb :fields
      t.string :name
    end
  end
end