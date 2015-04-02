class AddNamespaceUpwardClosureView < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute """
CREATE OR REPLACE VIEW namespace_upward AS
  (WITH RECURSIVE
    ns AS
    (SElECT
       id AS id,
       parent_id
     FROM
       namespaces
    UNION ALL
     SELECT
       ns.id,
       n_parent.parent_id
     FROM
       ns JOIN
       namespaces AS n_parent ON (ns.parent_id = n_parent.id))
  SELECT
    id,
    ARRAY_AGG(parent_id) AS upward
  FROM
    ns
  GROUP BY id)
"""
  end

  def down
    ActiveRecord::Connection.execute <<SQL
DROP VIEW IF EXISTS namespace_upward
SQL
  end
end
