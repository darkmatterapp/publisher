POST_TYPES = {
  activity: 'activities',
  article:  'articles',
  bookmark: 'bookmarks',
  event:    'events',
  note:     'notes',
  photo:    'photos',
  sound:    'sounds',
  video:    'videos'
}.freeze
YEAR_MONTH_DAY_CONSTRAINTS = { year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/ }.freeze
PAGINATION_CONSTRAINTS     = { page: /\d+/ }.freeze
YEAR_MONTH_DAY_PATH        = '/:year/:month/:day'.freeze

Rails.application.routes.draw do
  root to: 'root#index'

  # Admin Dashboard
  namespace :admin do
    resources :links # rel-me links
    resources :redirects, except: :show # Redirects Manager
    resources :settings, only: [:index, :edit, :update] # Settings
    resources :tags
  end

  # NEW Post Launchpad
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'new',       to: 'dashboard#new',   as: 'dashboard_new'

  # Posts (Composite Feed) Pagination and RSS/Atom feed
  get 'posts',                    to: 'posts#index', as: 'posts'
  get 'page/1',                   to: redirect('/'), as: 'posts_pagination_redirect_one'
  get 'page',                     to: redirect('/'), as: 'posts_pagination_redirect'
  get 'page/:page',               to: 'posts#index', constraints: PAGINATION_CONSTRAINTS
  get '(/:year)(/:month)(/:day)', to: 'posts#index', constraints: YEAR_MONTH_DAY_CONSTRAINTS
  get 'feed',                     to: 'posts#index', defaults: { format: 'atom' }, as: :feed

  # Users + Auth
  resources :users,    only: [:create, :update, :destroy]
  resources :sessions, only: [:create]
  get 'profile', to: 'users#edit',       as: 'profile'
  get 'signup',  to: 'users#new',        as: 'signup'
  get 'signin',  to: 'sessions#new',     as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  POST_TYPES.each do |singular, plural|
    # RSS/Atom feeds
    get "/#{plural}/feed", to: "#{plural}#index", defaults: { format: 'atom' }, as: "#{plural}_feed"

    # Post CRUD
    get    "#{plural}/new",                              to: "#{plural}#new",    as: "new_#{singular}"
    post   plural.to_s,                                  to: "#{plural}#create"
    get    "#{plural}",                                  to: "#{plural}#index"
    get    "#{plural}#{YEAR_MONTH_DAY_PATH}/:slug",      to: "#{plural}#show",   as: singular.to_s,      constraints: YEAR_MONTH_DAY_CONSTRAINTS
    get    "#{plural}#{YEAR_MONTH_DAY_PATH}/:slug/edit", to: "#{plural}#edit",   as: "edit_#{singular}", constraints: YEAR_MONTH_DAY_CONSTRAINTS
    patch  "#{plural}#{YEAR_MONTH_DAY_PATH}/:slug",      to: "#{plural}#update",                         constraints: YEAR_MONTH_DAY_CONSTRAINTS
    put    "#{plural}#{YEAR_MONTH_DAY_PATH}/:slug",      to: "#{plural}#update",                         constraints: YEAR_MONTH_DAY_CONSTRAINTS
    delete "#{plural}#{YEAR_MONTH_DAY_PATH}/:slug",      to: "#{plural}#destroy",                        constraints: YEAR_MONTH_DAY_CONSTRAINTS

    # Post Pagination
    get "#{plural}/page/1",                     to: redirect("/#{plural}")
    get "#{plural}/page",                       to: redirect("/#{plural}")
    get "#{plural}/page/:page",                 to: "#{plural}#index", constraints: PAGINATION_CONSTRAINTS
    get "(/#{plural})(/:year)(/:month)(/:day)", to: "#{plural}#index", constraints: YEAR_MONTH_DAY_CONSTRAINTS
  end

  # Syndication
  post 'syndicators/:post_type/:id/:service', to: 'syndicators#create', as: :syndicators

  # Syndication Auth
  get  'auth/:provider/setup',    to: 'providers#setup'
  get  'auth/:provider/callback', to: 'providers#create'
  post 'auth/:provider/callback', to: 'providers#create'

  # Pages CRUD (Articles acting as Pages)
  get 'pages/new',  to: 'pages#new',    as: 'new_page'
  post 'pages',     to: 'pages#create', as: 'pages'
  get 'pages',      to: 'pages#index'
  post ':slug',     to: 'pages#create', constraints: YEAR_MONTH_DAY_CONSTRAINTS
  get ':slug/edit', to: 'pages#edit', as: 'edit_page', constraints: YEAR_MONTH_DAY_CONSTRAINTS
  patch ':slug',    to: 'pages#update',                  constraints: YEAR_MONTH_DAY_CONSTRAINTS
  delete ':slug',   to: 'pages#destroy',                 constraints: YEAR_MONTH_DAY_CONSTRAINTS

  # Site Search
  get 'search', to: 'search#index', as: 'search'

  # Tags
  resources :tags

  # Micropub
  get 'micropub', to: 'about#micropub', as: 'micropub'

  # Site photo / avatar
  get 'photo(.format)', to: 'about#site_photo'

  # PGP/GPG public key
  get 'key.pub', to: 'about#public_key', as: 'public_key'

  # Keybase.io identity proof
  get 'keybase.txt', to: 'about#keybase_proof', as: 'keybase_proof'

  # Redirection and Page lookup as a fallback to all routes
  get ':slug', to: 'pages#show', as: 'page'
end
