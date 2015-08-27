#require_relative '../app/models'

post '/post/new_post' do
  post_title = params[:post_title]
  post_text = params[:post_text]
  post_author = params[:post_author]
  tags = params[:tags]

  @post = Post.new(post_title: post_title, post_text: post_text, post_author: post_author)

  tags.each_key do |tag|
    @tag = Tag.find_or_create_by(tag_text: tag)
    @tag.posts << @post
  end

  @post.save

  redirect to("/post/#{@post.id}")
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/post/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

post '/post/:id/delete' do
   @post = Post.find(params[:id])
   Post.delete(@post)

   redirect to ('/')
 end
=begin
post '/post/:id/save' do
  post_title = params[:post_title]
  post_text = params[:post_text]
  post_author = params[:post_author]
  new_tags = params[:tags]

  existing_post = Post.find(params[:id])
  existing_post[:post_title] = post_title
  existing_post[:post_text] = post_text
  existing_post[:post_author] = post_author

  existing_tag = PostTag.where(post_id: params[:id])
  existing_tag.each {|tag| tag.delete}
=end
