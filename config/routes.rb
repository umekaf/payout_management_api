Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchant_disbursements, only: :index
    end
  end
end
