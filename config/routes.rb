Easyblog::Application.routes.draw do
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :posts do
  	resources :comments do
      member do
        post :mark_as_not_abusive
        post :vote_up
      end
    end
    member do
      post :mark_archived
    end
  end
end
