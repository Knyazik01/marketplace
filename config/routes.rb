Rails.application.routes.draw do
  # resources :users # control under users should be opened for admins
  controller :users do
    post 'registration' => :create
  end

  controller :auth do
    post 'login' => :login
    get 'me' => :get_auth_user
    # delete 'logout' => :destroy
  end

  controller :ads do
    resources :ads
    get 'my-ads' => :my_ads
  end
end
