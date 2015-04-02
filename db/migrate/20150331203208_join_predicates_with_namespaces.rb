class JoinPredicatesWithNamespaces < ActiveRecord::Migration
  def change
    create_table :namespaces_predicates, id: false do |t|
      t.references :namespaces
      t.references :predicates
    end
  end
end
