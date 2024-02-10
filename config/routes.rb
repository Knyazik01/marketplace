Rails.application.routes.draw do
  # resources :favourite_ads
  # TODO add routes for favourite_ads:
  #  - add/remove from favorite (with auth user)
  #  - show my favourite_ads (only favorite ads for auth user)

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
