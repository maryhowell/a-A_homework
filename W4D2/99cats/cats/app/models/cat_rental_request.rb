class CatRentalRequest < ApplicationRecord
  STATUS_STATES = %w(APPROVED DENIED PENDING)
  #association
  belongs_to :cat

  after_initialize :assign_pending_status
  validates :status, inclusion: STATUS_STATES
  validates(
    :cat_id,
    :start_date,
    :end_date,
    :status,
    presence: true
    )

  # validate :does_not_overlap_approved_requests
  # validate :start_must_come_before_end
  # validate :does_not_overlap_approved_request

  def approve!
    raise "not pending" unless self.status == "PENDING"
    transaction do
      self.status = "APPROVED"
      self.save!

      # when we approve this request, we reject all other overlapping
      # requests for this cat.
      overlapping_pending_requests.update_all(status: 'DENIED')
    end
  end

  def approved?
    self.status == "APPROVED"
  end

  def denied?
    self.status == "DENIED"
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def pending?
    self.status == "PENDING"
  end

private

# already has status or assigns to pending
  def assign_pending_status
    self.status ||= "PENDING"
  end

#https://stackoverflow.com/questions/325933/determine-whether-two-date-ranges-overlap
  def overlapping_requests
  CatRentalRequest
     .where.not(id: self.id)
     .where(cat_id: cat_id)
     .where(<<-SQL, start_date: start_date, end_date: end_date)
        NOT( (start_date > :end_date) OR (end_date < :start_date) )
     SQL
  end

 def overlapping_approved_requests
   overlapping_requests.where("status = 'APPROVED'")
 end

 def overlapping_pending_requests
   overlapping_requests.where("status = 'PENDING'")
 end

 # def does_not_overlap_approved_request
 #   # A denied request doesn't need to be checked. A pending request
 #   # should be checked; users shouldn't be able to make requests for
 #   # periods during which a cat has already been spoken for.
 #   return if self.denied?
 #
 #   unless overlapping_approved_requests.empty?
 #     errors[:base] <<
 #       "Request conflicts with existing approved request"
 #   end
 # end

 def start_must_come_before_end
   return if start_date < end_date
   errors[:start_date] << "must come before end date"
   errors[:end_date] << "must come after start date"
 end

end
