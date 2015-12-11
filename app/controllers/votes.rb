post '/posts/:id/votes' do
  post = Post.find(params[:id])
  value = params[:value] == 'up' ? 1 : -1

  if current_user
    Vote.create(
      voter_id: current_user.id,
      post_id: params[:id],
      value: value
      )
  end

  if post.post_type == "question"
    redirect "/posts/#{post.id}"
  else
    redirect "/posts/#{post.question.id}"
  end
end
