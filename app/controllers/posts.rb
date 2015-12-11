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
        redirect '/posts'
    else
      @question = Post.find(params[:question_id])
      @answers = @question.answers
      Post.create(
        post_type:"answer",
        body:params[:body] ,
        author_id: current_user.id ,
        question_id: params[:question_id])
        erb :'posts/show'
    end
  else
    redirect '/posts'
  end
end

get '/posts/:id' do
  @question = Post.find(params[:id])
  @answers = @question.answers
  erb :'/posts/show'
end

put '/posts/:id' do
  @question = Post.find(params[:id])
  @answer = Post.find(params[:answer_id])
  unless @question.best_answer_to_question && current_user == @question.author
    @answer.update(best_answer:true)
  end
  redirect "/posts/#{@question.id}"

end

