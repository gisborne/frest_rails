class ChangeParentToParentIdOnNamespace < ActiveRecord::Migration
  def change
    rename_column :namespaces, :parent, :parent_id
  end
end
