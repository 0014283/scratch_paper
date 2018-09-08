Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  root 'home#top'

  post 'paper_albums/:id/add_image' => 'peper_albums#add_item', as: :paper_albums_add_image
  patch 'paper_albums/:id/update_image' => 'paoer_albums#update_image', as: :paper_albums_update_image
  delete 'paper_albums/:id/delete_image' => 'paper_albums#delete_image', as: :paper_albums_delete_image
  get 'home/top'
  get 'home/about'



  resources :users, only: [:edit, :update, :index, :destroy]do
  	member do
  		get :following, :followers, :my_list, :interest_list, :following_list
    end
  end

  delete '/users/:id' => 'users#destroy'

  resources :papers do
  	resource :likes, only: [:create, :destroy]
  	resource :interests, only: [:create, :destroy]
  end

end
