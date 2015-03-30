class Namespace < ActiveRecord::Base
  belongs_to :parent, class_name: 'Namespace', inverse_of: :children

  has_many :children, class_name: 'Namespace', foreign_key: :parent_id, inverse_of:  :parent

  def self.get_root
    Frest::RootNamespace
  end

  def add_child id = SecureRandom.uuid, name = nil
    children.create id: id, name: name
  end


end
