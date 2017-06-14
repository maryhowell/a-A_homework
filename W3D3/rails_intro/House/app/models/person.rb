class Person < ActiveRecord::Base
  has_many :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
    
end
