Rails.application.routes.draw do
  root to: "posts#index"

  # Users + auth
  resources :users, :sessions
  get "signup", to: "users#new", as: "signup"
  get "signin", to: "sessions#new", as: "signin"
  get "signout", to: "sessions#destroy", as: "signout"
  get "profile", to: "users#edit", as: "profile"

  # RSS/Atom feeds
  get "/feed", to: "posts#index", defaults: {format: "atom"}, as: :feed
  get "/articles/feed", to: "articles#index", defaults: {format: "atom"}, as: :articles_feed
  get "/bookmarks/feed", to: "bookmarks#index", defaults: {format: "atom"}, as: :bookmarks_feed
  get "/notes/feed", to: "notes#index", defaults: {format: "atom"}, as: :notes_feed
  get "/photos/feed", to: "photos#index", defaults: {format: "atom"}, as: :photos_feed
  get "/sounds/feed", to: "sounds#index", defaults: {format: "atom"}, as: :sounds_feed
  get "/videos/feed", to: "videos#index", defaults: {format: "atom"}, as: :videos_feed

  # Articles CRUD
  get "/articles/new", to: "articles#new", as: "new_article"
  post "/articles", to: "articles#create", as: "articles"
  post "/articles/:year/:month/:day", to: "articles#create", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  get "/articles/:year/:month/:day/:slug", to: "articles#show", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "article"
  get "/articles/:year/:month/:day/:slug/edit", to: "articles#edit", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "edit_article"
  patch "/articles/:year/:month/:day/:slug", to: "articles#update", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  delete "/articles/:year/:month/:day/:slug", to: "articles#destroy", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Articles Pagination
  get "/articles/page/1",                    to: redirect("/articles")
  get "/articles/page",                      to: redirect("/articles")
  get "/articles/page/:page",                to: "articles#index", constraints: {page: /\d+/}
  get "(/articles)(/:year)(/:month)(/:day)", to: "articles#index", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Bookmarks CRUD
  get "/bookmarks/new", to: "bookmarks#new", as: "new_bookmark"
  post "/bookmarks", to: "bookmarks#create", as: "bookmarks"
  post "/bookmarks/:year/:month/:day", to: "bookmarks#create", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  get "/bookmarks/:year/:month/:day/:slug", to: "bookmarks#show", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "bookmark"
  get "/bookmarks/:year/:month/:day/:slug/edit", to: "bookmarks#edit", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "edit_bookmark"
  patch "/bookmarks/:year/:month/:day/:slug", to: "bookmarks#update", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  delete "/bookmarks/:year/:month/:day/:slug", to: "bookmarks#destroy", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Bookmarks Pagination
  get "/bookmarks/page/1",                    to: redirect("/bookmarks")
  get "/bookmarks/page",                      to: redirect("/bookmarks")
  get "/bookmarks/page/:page",                to: "bookmarks#index", constraints: {page: /\d+/}
  get "(/bookmarks)(/:year)(/:month)(/:day)", to: "bookmarks#index", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Events CRUD
  get "/events/new", to: "events#new", as: "new_event"
  post "/events", to: "events#create", as: "events"
  post "/events/:year/:month/:day", to: "events#create", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  get "/events/:year/:month/:day/:slug", to: "events#show", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "event"
  get "/events/:year/:month/:day/:slug/edit", to: "events#edit", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "edit_event"
  patch "/events/:year/:month/:day/:slug", to: "events#update", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  delete "/events/:year/:month/:day/:slug", to: "events#destroy", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Events Pagination
  get "/events/page/1",                    to: redirect("/events")
  get "/events/page",                      to: redirect("/events")
  get "/events/page/:page",                to: "events#index", constraints: {page: /\d+/}
  get "(/events)(/:year)(/:month)(/:day)", to: "events#index", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Notes CRUD
  get "/notes/new", to: "notes#new", as: "new_note"
  post "/notes", to: "notes#create", as: "notes"
  post "/notes/:year/:month/:day", to: "notes#create", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  get "/notes/:year/:month/:day/:slug", to: "notes#show", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "note"
  get "/notes/:year/:month/:day/:slug/edit", to: "notes#edit", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "edit_note"
  patch "/notes/:year/:month/:day/:slug", to: "notes#update", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  delete "/notes/:year/:month/:day/:slug", to: "notes#destroy", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Notes Pagination
  get "/notes/page/1",                    to: redirect("/notes")
  get "/notes/page",                      to: redirect("/notes")
  get "/notes/page/:page",                to: "notes#index", constraints: {page: /\d+/}
  get "(/notes)(/:year)(/:month)(/:day)", to: "notes#index", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Photos CRUD
  get "/photos/new", to: "photos#new", as: "new_photo"
  post "/photos", to: "photos#create", as: "photos"
  post "/photos/:year/:month/:day", to: "photos#create", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  get "/photos/:year/:month/:day/:slug", to: "photos#show", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "photo"
  get "/photos/:year/:month/:day/:slug/edit", to: "photos#edit", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "edit_photo"
  patch "/photos/:year/:month/:day/:slug", to: "photos#update", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  delete "/photos/:year/:month/:day/:slug", to: "photos#destroy", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Photos Pagination
  get "/photos/page/1",                    to: redirect("/photos")
  get "/photos/page",                      to: redirect("/photos")
  get "/photos/page/:page",                to: "photos#index", constraints: {page: /\d+/}
  get "(/photos)(/:year)(/:month)(/:day)", to: "photos#index", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Sounds CRUD
  get "/sounds/new", to: "sounds#new", as: "new_sound"
  post "/sounds", to: "sounds#create", as: "sounds"
  post "/sounds/:year/:month/:day", to: "sounds#create", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  get "/sounds/:year/:month/:day/:slug", to: "sounds#show", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "sound"
  get "/sounds/:year/:month/:day/:slug/edit", to: "sounds#edit", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "edit_sound"
  patch "/sounds/:year/:month/:day/:slug", to: "sounds#update", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  delete "/sounds/:year/:month/:day/:slug", to: "sounds#destroy", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Sounds Pagination
  get "/sounds/page/1",                    to: redirect("/sounds")
  get "/sounds/page",                      to: redirect("/sounds")
  get "/sounds/page/:page",                to: "sounds#index", constraints: {page: /\d+/}
  get "(/sounds)(/:year)(/:month)(/:day)", to: "sounds#index", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Videos CRUD
  get "/videos/new", to: "videos#new", as: "new_video"
  post "/videos", to: "videos#create", as: "videos"
  post "/videos/:year/:month/:day", to: "videos#create", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  get "/videos/:year/:month/:day/:slug", to: "videos#show", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "video"
  get "/videos/:year/:month/:day/:slug/edit", to: "videos#edit", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}, as: "edit_video"
  patch "/videos/:year/:month/:day/:slug", to: "videos#update", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}
  delete "/videos/:year/:month/:day/:slug", to: "videos#destroy", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Videos Pagination
  get "/videos/page/1",                    to: redirect("/videos")
  get "/videos/page",                      to: redirect("/videos")
  get "/videos/page/:page",                to: "videos#index", constraints: {page: /\d+/}
  get "(/videos)(/:year)(/:month)(/:day)", to: "videos#index", constraints: {year: /\d{4}/, month: /\d{1,2}/, day: /\d{1,2}/}

  # Settings
  resources :settings, only: [:index, :edit, :update]
  get "key.pub", to: "about#public_key", as: "public_key"

  # rel-me links
  resources :links

  # Tags
  get "tags", to: "tags#index", as: "tags"
  get "tags/:slug", to: "tags#show", as: "tag"

  # Redirects Manager
  resources :redirects, except: :show

  # Redirection and Page lookup as a fallback to all routes
  resources :pages, except: [:show]
  get ":path", to: "pages#show", as: "slugged_page"
end
