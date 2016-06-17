class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  
  has_many :comments, dependent: :nullify
  validates(:title, {presence: {message: "must be present!"}, uniqueness: true})

  def self.search(search)
    # where("title LIKE ?", "%#{search}%")
    # where("body LIKE ?", "%#{search}%")
    where("title ILIKE :word OR body ILIKE :word", {word: "%#{search}%"})
  end

  def first_new_comments
    comments.order(created_at: :desc)
  end


end
