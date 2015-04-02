class AddJsonbMergelFunction < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute """
CREATE FUNCTION jsonb_mergel(jsonb, jsonb)
   RETURNS jsonb AS $$
     WITH json_union AS
       (SELECT * FROM jsonb_each_text($1)
          UNION ALL
        SELECT * FROM jsonb_each_text($2))
     SELECT json_object_agg(key, value)::jsonb FROM json_union;
   $$ LANGUAGE SQL;
"""
  end

  def down
    ActiveRecord::Base.connection.execute """
DROP FUNCTION IF EXISTS jsonb_mergel(jsonb, jsonb)
"""
  end
end
