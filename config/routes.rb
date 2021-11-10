Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[show index new create] do
    resources :bookmarks, only: %i[show index new create destroy]
    resources :movies, only: %i[show index new create destroy]
  end
end
