Rails.application.routes.draw do
  post '/currency_exchange', to: 'exchange#exchange_api'
end
