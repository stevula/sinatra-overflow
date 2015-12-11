get '/posts' do
  @posts = Post.all
  erb :'/posts/index'
end

post '/posts' do
  redirect '/posts'
end

get '/posts/:id' do
  @question = Post.find(params[:id])
  @answers = @question.answers
  erb :'/posts/show'
end
