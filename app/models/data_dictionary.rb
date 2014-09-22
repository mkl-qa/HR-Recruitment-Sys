class DataDictionary < ActiveRecord::Base
  validates :name, :uniqueness => true
  validates :name, :presence => true
end
