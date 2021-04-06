class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :snkrs, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_snkrs, through: :likes, source: :snkr

  def already_liked?(snkr)
    self.likes.exists?(snkr_id: snkr.id)
  end

end
