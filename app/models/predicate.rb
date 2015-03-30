class Predicate < ActiveRecord::Base
  def self.create args
    id = args.delete    :id
    name = args.delete  :name
    fn = args.delete    :fn

    super name: name, fn: fn, fields: args.to_json
  end
end
