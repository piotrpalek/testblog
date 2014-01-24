class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :abusive, type: Boolean, default: false

  validates_presence_of :body, :user

  belongs_to :user
  belongs_to :post

  has_many :votes

  def mark_abusive!
    update_attribute :abusive, true
  end

  def mark_not_abusive!
    update_attribute :abusive, false
  end

  def vote_up(user_id)
    vote = vote_for_user(user_id)
    vote.value = 1
    vote.save
  end

  private

  def vote_for_user(user_id)
    Vote.where(
      user_id: user_id,
      comment_id: id
    ).first_or_create
  end
end
