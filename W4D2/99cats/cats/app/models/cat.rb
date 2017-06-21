class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = %w(tuxedo calico black white)

  validates :color, inclusion: COLORS
  validates :sex, inclusion: { in: %w( M F ) }
  validates(
    :birth_date,
    :color,
    :name,
    :sex,
    presence: true
    )

  has_many :rental_requests,
    class_name: "CatRentalRequest",
    :dependent => :destroy


  #TODO
  def age
    Date.today.year - birth_date.year
  end

end
