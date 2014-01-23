class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  def author
    self[:author] || "n/a"
  end
end
