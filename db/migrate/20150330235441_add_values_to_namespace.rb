class AddValuesToNamespace < ActiveRecord::Migration
  def change
    change_table :namespaces do |t|
      t.jsonb :values
    end
  end
end
