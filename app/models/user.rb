class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction,length: { maximum: 50}
  
  has_many :books, dependent: :destroy
  attachment :profile_image
  # いいね機能
  has_many :favorites, dependent: :destroy
  
  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end
  # コメント機能
  has_many :book_comments, dependent: :destroy
  
end
