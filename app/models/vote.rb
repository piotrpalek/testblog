class Vote
  include Mongoid::Document
  include Mongoid::Timestamps

  after_save :check_comment

  field :value, type: Integer

  validates_presence_of :value

  belongs_to :user
  belongs_to :comment

  private

  def check_comment
    if self.comment.negative_votes.count >= 3
      self.comment.mark_abusive!
    end
  end

end
