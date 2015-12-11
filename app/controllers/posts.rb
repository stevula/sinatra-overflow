get '/posts' do
  @posts = Post.where(post_type: "question")
  erb :'/posts/index'
end

post '/posts' do
  Post.create(post_type:"answer", body:params[:body] , author_id:current_user.id , question_id:params[:question_id])
  redirect '/posts'
end

get '/posts/:id' do
  @question = Post.find(params[:id])
  @answers = @question.answers
  erb :'/posts/show'
end
