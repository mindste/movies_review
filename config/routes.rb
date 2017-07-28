Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # 默认路径
  root  "movies#index"

  # 管理员帐号下的电影管理
  namespace  :admin  do
    resources :movies
  end

  #  搜索及评论、收藏功能
  resources  :movies  do
    collection  do
      get 'search'
    end
    member  do
      post  :join
      post  :quit
    end
    resources  :reviews
  end

  namespace  :account  do
    resources  :collections
  end




end
