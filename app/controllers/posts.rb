get '/posts' do

  erb :'/index'
end

post '/posts' do
  redirect '/posts'
end

get '/posts/:id' do
  @question = Post.find(params[:id])
  @answers = @question.answers
  erb :'/posts/show'
end
