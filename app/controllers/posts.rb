get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

post '/posts' do

  redirect '/posts'
end

get '/posts/:id' do
  @posts = Post.find(params[:id])
  @answers = @posts.answers
  erb :'/posts/show'
end
