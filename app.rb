require "sinatra/base"
require_relative "./lib/bookmark.rb"
require "pg"

class BookmarkManager<Sinatra::Base
  enable :sessions
  get "/" do
    erb :index
  end

  get "/bookmarks" do
    p ENV

    @bookmarks = Bookmark.all

    erb :index
  end

  get "/bookmarks/new" do
    erb :'bookmarks/new'
  end

  post "/bookmarks" do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
