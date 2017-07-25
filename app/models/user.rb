class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :movies
  has_many  :reviews, dependent: :destroy   #reviews和user关联，user注销，reviews也会删除。

  def  admin?
    is_admin
  end

end
