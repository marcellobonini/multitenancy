Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, 
    path: 'user',
    path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
    controllers:{ sessions: 'users/sessions', registrations: 'users/registrations'}
  resources :gyms, path: 'g' do
    resources :members
  end
  root "home#index"
end
