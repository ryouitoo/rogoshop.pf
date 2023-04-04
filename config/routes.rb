Rails.application.routes.draw do
  
  root to: 'homes#top'
  
  # 顧客用
# URL /customers/sign_in ...
devise_for :user,skip: [:passwords], controllers: {
  registrations: "userc/registrations",
  sessions: 'user/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#ユーザ側
  scope module: :user do

   root "homes#top"
   get "/about" => "homes#about", as: "about"


    # ユーザー詳細
      get "customers/out" => "customers#out" #退会確認画面
      patch "customers/withdraw" => "customers#withdraw" #退会処理(ステータスの更新)
      get "customers/my_page" => "customers#show"
      get "customers/information/edit" => "customers#edit"
      patch "customers/information" => "customers#update"

    #作品
     resources :logo, only: [:index, :new, :create, :show, :edit, :update, :delete]


end
end
