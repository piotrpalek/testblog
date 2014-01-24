class Vote
  include Mongoid::Document
  include Mongoid::Timestamps

  field :value, type: Integer

  validates_presence_of :value

  belongs_to :user
  belongs_to :comment
end
