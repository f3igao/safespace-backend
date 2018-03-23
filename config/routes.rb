Rails.application.routes.draw do
  resources :stories, except: [:new, :edit] do
    resources :comments, except: [:new, :edit]
  end
  resources :users, except: [:new, :edit]
  resources :tags, only: [:index, :show]
end
