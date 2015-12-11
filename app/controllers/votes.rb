post '/posts/:id/votes' do
  value = params[:value] == 'up' ? 1 : -1
  post = Post.find(params[:id])
  Vote.create(
    voter_id: current_user.id,
    post_id: params[:id],
    value: value
    )
  if post.post_type == "question"
    redirect "/posts/#{post.id}"
  else
    redirect "/posts/#{post.question.id}"
  end
end
