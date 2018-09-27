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

  get 'home/top'
  get 'users/admin_index'
  get 'papers/admin_index'



  resources :users, only: [:edit, :update, :index, :destroy]do
  	member do
  		get :following, :followers, :my_list, :interest_list, :following_list
    end
  end
  resources :relationships, only: [:create, :destroy]

  delete '/users/:id' => 'users#destroy'

  resources :papers, only: [:new, :index, :show, :create, :destroy] do
  	resource :likes, only: [:create, :destroy]
  	resource :interests, only: [:create, :destroy]
  end

end
