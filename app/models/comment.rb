class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String

  validates_presence_of :body, :user

  belongs_to :user
  belongs_to :post

end
