Rails.application.routes.draw do
  devise_for :users, path: 'user', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :gyms do
    resources :members
  end
  root to: "gyms#index"
end
