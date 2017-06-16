class Response < ApplicationRecord
  validate :not_duplicate_response, :respondent_is_not_poll_author
  
  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :respondent,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: 'User'

  has_one :question,
      through: :answer_choice,
      source: :question


  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(respondent_id: self.respondent_id)

  end

  def not_duplicate_response
    if respondent_already_answered?
      self.errors.add(:respondent, "You selected the same thing. wooow")
    end
  end

  def respondent_is_not_poll_author
  # The 3-query slow way:
  # poll_author_id = self.answer_choice.question.poll.author_id

  # 1-query; joins two extra tables.
    poll_author_id = Poll
      .joins(questions: :answer_choices)
      .where("answer_choices.id = ?", self.answer_choice_id)
      .pluck("polls.author_id")
      .first

    if poll_author_id == self.respondent_id
      errors[:respondent_id] << "cannot be poll author"
    end
  end

end
