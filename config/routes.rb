Rails.application.routes.draw do
  post '/trouble_solutions/callback' => 'trouble_solutions#callback'
end
