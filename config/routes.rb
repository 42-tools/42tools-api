Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ResqueWeb::Engine => '/resque' if Rails.env.production?

  root to: redirect('/admin')

  scope format: false do
    resource :auth, only: %i(create)
    resources :apps_tokens, only: %i(index show)
    resources :apps, only: %i(index show)
    resources :projects_users_cursus, only: %i(index show)
    resources :projects_users, only: %i(index show)
    resources :projects, only: %i(index show)
    resources :campus_users, only: %i(index show)
    resources :campus, only: %i(index show)
    resources :groups_users, only: %i(index show)
    resources :groups, only: %i(index show)
    resources :cursus_users, only: %i(index show)
    resources :cursus, only: %i(index show)
    resources :users, only: %i(index show)

    resources :friends_groups, controller: :friends_groups, as: :friends_group do
      resources :friends, controller: :friends_groups_users, only: %i(index show create destroy)
    end
    resources :friends, controller: :friends_users, only: %i(index show create destroy)

    resources :logs
  end
end
