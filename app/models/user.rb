class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: [:men,:lady]

  def birth #年月日に変換
   self.birth_day.strftime("%Y年 %m月 %d日")
  end
end
