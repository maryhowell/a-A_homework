class Todo < ApplicationRecord
  validates :boolean_field_name, inclusion: { in: [true, false] }
  validates :title, :body, presence: true

end
