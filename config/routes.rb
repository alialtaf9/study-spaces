StudySpaces::Application.routes.draw do

  match 'login', :to => 'sessions#new'
  match 'auth/facebook/callback', :to => 'sessions#create'
  match 'logout', :to => 'sessions#destroy'
  match 'homepage', :to => 'users#homepage'
end
