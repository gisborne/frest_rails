class CreateNamespace < ActiveRecord::Migration
  def change
    create_table :namespaces, id: :uuid do |t|
      t.string :name
      t.uuid :parent, references: :namespaces
    end
  end
end
