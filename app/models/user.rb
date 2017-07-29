class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #  评论功能
  has_many  :movies
  has_many  :reviews, dependent: :destroy   #reviews和user关联，user注销，reviews也会删除。

  #  收藏功能
  has_many  :collections             # 收藏电影
  has_many  :participated_movies, through: :collections, source: :movie

  #  判断电影是否已收藏
  def is_member_of?(movie)
    participated_movies.include?(movie)
  end


  # 定义收藏动作
  def  join_collection!(movie)
    participated_movies  <<  movie
  end

  # 定义取消收藏动作
  def  quit_collection!(movie)
    participated_movies.delete(movie)
  end


  #  验证管理员身份
  def  admin?
    is_admin
  end

end
