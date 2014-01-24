class Vote
  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer

  validates_presence_of :score

  belongs_to :user
  belongs_to :comment
end
