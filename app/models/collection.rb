class Collection < ApplicationRecord
  # 收藏关系
  belongs_to  :user
  belongs_to  :movie
end
