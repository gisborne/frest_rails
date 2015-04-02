class CreateUpwardValuesView < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute <<SQL
CREATE OR REPLACE VIEW upward_values AS
  (WITH RECURSIVE
      ns AS
      (SElECT
        id AS id,
        parent_id,
        values,
        0 AS depth
       FROM
         namespaces
      UNION ALL
       SELECT
         ns.id,
         n_parent.parent_id,
         jsonb_mergel (n_parent.values, ns.values),
         ns.depth + 1
       FROM
         ns JOIN
         namespaces AS n_parent ON (ns.parent_id = n_parent.id)),
      max_depths AS
      (SELECT
        id,
        MAX(depth) AS max_depth
      FROM
        ns
      GROUP BY id)
    SELECT
      ns.id,
      values
    FROM
      ns JOIN
      max_depths ON (ns.id = max_depths.id AND ns.depth = max_depths.max_depth))
SQL
  end
end
