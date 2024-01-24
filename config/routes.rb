Rails.application.routes.draw do
  # resources :users # control under users should be opened for admins
  controller :users do
    post 'registration' => :create
  end

  controller :auth do
    post 'login' => :login
    # delete 'logout' => :destroy
  end

  resources :ads
end
