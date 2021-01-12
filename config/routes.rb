Rails.application.routes.draw do
  resources :snippets, defaults: { format: "json" } do
    get "like", on: :member
  end

  root "application#home"
end
