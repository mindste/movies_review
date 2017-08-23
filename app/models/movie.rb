class Movie < ApplicationRecord

  #  建立 movie 和 attachment 之间的关系
  has_many  :attachments,  :class_name  =>  "MovieAttachment", :dependent  =>  :destroy
  accepts_nested_attributes_for  :attachments,  :allow_destroy  =>  true,  :reject_if  =>  :all_blank

  #  只有  public 状态下可以在前台显示
  scope  :only_public,  -> {  where( :status  =>  "public" ) }
  scope  :only_available,  ->  {  where( :status  =>  ["public", "private"] ) }

  #  建立  movie  和  buyer 之间的关系
  has_many  :buyers,  :dependent  =>  :destroy

  #  验证之前生成乱码
  before_validation   :generate_friendly_id,  :on  =>  :create

  #  调整电影的顺序
  include  RankedModel
  ranks  :row_order

  #  三种状态
  STATUS  =  ["hidden", "public", "draft"]
  validates_inclusion_of  :status, :in  =>  STATUS

  #  大数据级的搜索
  searchkick
  scope  :recent, ->  { order("created_at  DESC") }

  # 建立 movie 和 attachment 之间的关系
  has_many  :tickets, :dependent  =>  :destroy,  :inverse_of  =>  :movie
  accepts_nested_attributes_for  :tickets, :allow_destroy  =>  true,  :reject_if  =>  :all_blank

  # 收藏电影功能
  has_many  :collections  # 收藏电影
  has_many  :members, through: :collections, source: :user


  # 评论功能
  belongs_to  :user
  has_many  :reviews, dependent: :destroy   # 电影留言关系，dependent: :destroy表示联级删除


  #  验证title, description不得为空
  validates :title, presence: true

  #  paperclip  图片上传
  has_attached_file :image, styles: { medium: "400x600>", thumb: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def   to_param
    self.friendly_id
  end

  #  生成随机乱码
  def  generate_friendly_id
    self.friendly_id  ||=   SecureRandom.uuid
  end

end
