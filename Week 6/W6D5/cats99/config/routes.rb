Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :cats, only: [:index, :show, :new, :update, :create]

  # routes looks at the request and decides which controller to direct to
  #   --> execute and action/methods
  #   --> render :show
  #     --> views show.html.erb
  #     --> do whatever
end
