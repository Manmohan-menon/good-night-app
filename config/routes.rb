Rails.application.routes.draw do
  resources :sleep_records, only: [:create] do
    collection do
      get 'clock_in_times'
      get 'friends_records_sleep_records/:user_id', to: 'sleep_records#friends_records_sleep_records'
    end
  end
  resources :relationships, only: [:create, :destroy]
end
