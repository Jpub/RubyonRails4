 require 'TimeConstraint'

Railbook::Application.routes.draw do
  resources :fan_comments

  # resource :config

  # get "ajax/test"
  # get "extra/sendmail"
  # get "hello/list"

   resources :members

   resources :fun_comments

   resources :reviews

   resources :authors

   resources :users

   resources :books

  # resources :books, constraints: { id: /[0-9]{1,2}/ }

  # constraints(id: /[0-9]{1,2}/) do
  #   resources :books
  #   resources :reviews
  # end

  # resources :books, constraints: TimeConstraint.new
  # resources :books, format: false

  # resources :users, controller: :members
  # resources :reviews, as: :comments

  # namespace :admin do
  #   resources :books
  # end

  # scope module: :admin do
  #   resources :books
  # end

  # scope :admin do
  #   resources :books
  # end

  # scope ':locale' do
  #   resources :books
  # end


  # resources :reviews do
  #   collection do
  #     get :unapproval
  #   end
  #   member do
  #     get :draft
  #   end
  # end

  # resources :reviews do
  #   get :unapproval, on: :collection
  #   get :draft, on: :member
  # end

  # resources :users, except: [ :show, :destroy ]
  # resources :users, only: [ :index, :new, :create, :edit, :update ]
  # resources :reviews, path_names:  { new: :insert, edit: :revise }

  # resources :books do
  #   resources :reviews
  # end

  # resources :books do
  #   resources :reviews, shallow: true
  # end

  # resources :books do
  #   resources :reviews, only: [ :index, :new, :create ]
  # end
  # resources :reviews, except: [ :index, :new, :create ]

  # scope shallow_path: :b do
  #   resources :books do
  #     resources :reviews, shallow: true
  #   end
  # end

  # scope shallow_prefix: :b do
  #   resources :books do
  #     resources :reviews, shallow: true
  #   end
  # end

  # concern :additional do
  #   get :unapproval, on: :collection
  #   get :draft, on: :member
  # end

  # resources :reviews, concerns: :additional
  # resources :users, concerns: :additional

  # get '/blogs/:user_id' => 'blogs#index'
  # get '/blogs/:user_id', to: 'blogs#index'
  # get 'hello/view' 
  # get '/articles(/:category)' => 'articles#index',
  #  defaults: { category: 'general', format: 'xml' }

  # get 'blogs/:user_id' => 'blogs#index',
  #  constraints: { user_id: /[A-Za-z0-9]{3,7}/ }

  # get 'blogs/:user_id' => 'blogs#index', user_id: /[A-Za-z0-9]{3,7}/

  # get ':controller(/:action(/:id))', controller: /common\/[^\/]+/
  # get 'articles' => 'main#index', as: :top
  # get 'articles/*category/:id' => 'articles#category'
  # get '/books/:id' => redirect('/articles/%{id}')
  # get '/books/:id' => redirect {|p, req| "/articles/#{p[:id].to_i + 10000}" }

  # scope "(:locale)", locale: /ja|en|de/ do
  #   resources :books
  #   match ':controller(/:action(/:id))', via: [ :get ]
  # end

  # match '/:locale' => 'books#index', via: [ :get]
  # root to: 'books#index'

  # get ':controller(/:action(/:id(.:format)))'
  # post ':controller(/:action(/:id(.:format)))'
  # patch ':controller(/:action(/:id(.:format)))'
  # root to: 'books#index'
   match ':controller(/:action(/:id))', via: [ :get, :post, :patch ]
end
