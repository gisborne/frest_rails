class AddUuidFn < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
  end

  def down

  end
end
