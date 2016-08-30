Rails.application.routes.draw do
  scope defaults: { format: :json }, path: "/" do
    namespace :v1 do
      resources :backlogs, only: %i[index show create update destroy] do
        resources :stories, only: %i[create update destroy] do
          resources :scores, only: %i[create]
        end
      end
      resources :users, only: %i[create]
    end
  end
end
