require_relative '../models'

get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end
