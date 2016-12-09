Rails.application.routes.draw do
  get 'products/create'

  get 'products/edit'

  get 'devise/Seller'

  devise_for :sellers, controllers: { :sessions => "sellers/sessions" }
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
    member do
      put "like", to: "posts#upvote"
      put "dislike", to: "posts#downvote"
    end
  end

  resources :sellers do
    resources :products
  end

  resources :users do
    resources :images
    resources :friendships
  end


  get '/sign_in' => 'users/pages#sign_in', as: 'sign_in'
  get 'users/:id/show' => 'users/pages#show', as: 'user_profile'
  get 'sellers/:id/show' => 'sellers/pages#show', as: 'seller_profile'
  get 'users/:id/friendships/:friend_id/accept' => 'friendships#accept', as: 'user_friendship_accept'
  get 'users/:id/friendships/:friend_id/reject' => 'friendships#reject', as: 'user_friendship_reject'
  get 'users/:id/friendships/:friend_id/delete' => 'friendships#delete', as: 'user_friendship_delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
