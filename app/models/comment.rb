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
end
