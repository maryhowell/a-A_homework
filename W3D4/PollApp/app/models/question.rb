class Question < ApplicationRecord

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :answerchoices,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'Answerchoice'

  has_many :responses,
    through: :answerchoices,
    source: :responses


  def results

    # n+1 query == bad
  #   results = {}
  #   self.answer_choices.each do |resp|
  #     results[resp.text] = resp.responses.count
  #   end
  #   results
  # end

    # no n+1 storing information in counts and looking through that without
    # pingin the database 
    counts = self.answerchoices.includes(:responses)
    answer_choice_count = {}
    counts.each do |r|
      answer_choice_count[r.text] = r.responses.length
    end
    answer_choice_count
  end

end
