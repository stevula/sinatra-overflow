get '/posts' do
  # list all questions
  @posts = Post.where(post_type: "question")
  erb :'/posts/index'
end

post '/posts' do
  # logged in
  if current_user

    # creating a question
    if params[:post_type] == "question"
      Post.create(
        post_type: params[:post_type],
        title: params[:title],
        body: params[:body],
        author_id: current_user.id,
        question_id: params[:question_id])
        redirect '/posts'

    # creating an answer
    else
      @question = Post.find(params[:question_id])
      @answers = @question.answers
      Post.create(
        post_type: "answer",
        body: params[:body],
        author_id: current_user.id,
        question_id: params[:question_id])
        erb :'posts/show'
    end

  # not logged in
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

  # choosing best answer:
  # ensure best answer not already chosen and current user is the author of the question
  if current_user == @question.author && !@question.best_answer_to_question
    @answer.update(best_answer:true)
  end

  redirect "/posts/#{@question.id}"
end

