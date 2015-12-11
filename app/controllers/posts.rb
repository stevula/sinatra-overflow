get '/posts' do
  @posts = Post.where(post_type: "question")
  erb :'/posts/index'
end

post '/posts' do
if current_user
  if params[:post_type] == "question"
    Post.create(
      post_type: params[:post_type],
      title: params[:title],
      body: params[:body] ,
      author_id: current_user.id ,
      question_id: params[:question_id])
  else
    Post.create(
      post_type:"answer",
      body:params[:body] ,
      author_id: current_user.id ,
      question_id: params[:question_id])
    end
      redirect '/posts'
  else
    redirect '/posts'
  end
end

get '/posts/:id' do
  @question = Post.find(params[:id])
  @answers = @question.answers
  erb :'/posts/show'
end

