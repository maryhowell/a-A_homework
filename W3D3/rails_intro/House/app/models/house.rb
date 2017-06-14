class House < ActiveRecord::Base
  belongs_to :person,
    primary_key: :id,
    foreign_key: :person_id,
    class_name: 'Person'
end
