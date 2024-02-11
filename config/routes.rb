Rails.application.routes.draw do
  resources :comments
  # INFO: favourite_ads cannot be edit: only view, create and delete
  resources :favourite_ads, only: [:index, :show, :create, :destroy]

  # resources :users # control under users should be opened for admins
  controller :users do
    post 'registration' => :create

    # TODO add admin actions:
    #  - delete any user
  end

  controller :auth do
    post 'login' => :login
    get 'me' => :get_auth_user
    # delete 'logout' => :destroy
  end

  controller :ads do
    resources :ads
    get 'my-ads' => :my_ads

    # TODO add admin actions:
    #  - edit/delete any ad
  end
end
