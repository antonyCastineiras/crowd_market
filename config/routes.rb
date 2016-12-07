Rails.application.routes.draw do
  devise_for :users, controllers: { :registrations => "users/registrations",
                                    :sessions => "users/sessions",
                                    :pages => "users/pages"}

  root "posts#index"


  # devise_scope :user do
  # 	root to: "devise/sessions#new"
  #   resources :posts
	# end

  resources :posts, shallow: true do
  	resources :comments
  end

  resources :users do
    resources :images
  end



  get 'users/:id/show' => 'users/pages#show', as: 'user_profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
