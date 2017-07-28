class Movie < ApplicationRecord
  searchkick
  scope  :recent, ->  { order("created_at  DESC") }

  # 收藏电影功能
  has_many  :collections  # 收藏电影
  has_many  :members, through: :collections, source: :user


  # 评论功能
  belongs_to  :user
  has_many  :reviews, dependent: :destroy   # 电影留言关系，dependent: :destroy表示联级删除


  #  验证title, description不得为空
  validates :title, presence: true
  validates :description, presence: true

  #  paperclip  图片上传
  has_attached_file :image, styles: { medium: "400x600>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


end
