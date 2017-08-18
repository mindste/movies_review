Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 默认路径
  root  "movies#index"

  get  "/faq"  =>  "pages#faq"
  
  # 管理员帐号下的电影管理
  namespace  :admin  do
    resources :movies  do
      collection  do
        post  "bulk_update"
      end
    end
  end

  #  搜索及评论、收藏功能
  resources  :movies  do
    member  do
      post  :join  #  加入收藏
      post  :quit  #  取消收藏
    end

    collection  do
      get 'search'   # 搜索
    end

    resources  :reviews  # 评论
  end

  namespace  :account  do
    resources  :collections   # 电影收藏
  end




end
