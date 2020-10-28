require 'sidekiq/web'

if Rails.env.production?
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(username, 'admin') && ActiveSupport::SecurityUtils.secure_compare(password, ENV.fetch('ADMIN_PASSWORD'))
  end
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :items

  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
