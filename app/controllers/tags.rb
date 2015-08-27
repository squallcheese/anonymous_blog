#require_relative '../app/models'

post '/tags' do
  arr = []
  tags = params[:tags]
  tags.each_key do |tag|
  arr << tag
  end
  session[:tags] = arr
  redirect to ('/tags')
end

get '/tags' do
  @posts = []

  session[:tags].each do |tag|
    @tag = Tag.find_or_create_by(tag_text: tag)
    @tag.posts << @post
  end
end

erb :index