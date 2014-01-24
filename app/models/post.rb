class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Taggable

  field :body, type: String
  field :title, type: String
  field :archived, type: Boolean, default: false

  validates_presence_of :body, :title

  has_many :comments

  belongs_to :user

  default_scope ->{ ne(archived: true) }

  def archive!
    update_attribute :archived, true
  end

  def hotness
    hotness = self.comments.count >= 3 ? 1 : 0

    if self.created_at >= 1.days.ago
      return hotness + 3
    elsif self.created_at >= 3.days.ago
      return hotness + 2
    elsif self.created_at >= 7.days.ago
      return hotness + 1
    else self.created_at > 7.days.ago
      return hotness
    end

  end

end
