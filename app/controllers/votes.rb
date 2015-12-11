post '/posts/:id/votes' do
  post = Post.find(params[:id])
  value = params[:value] == 'up' ? 1 : -1

  if current_user
    new_vote = Vote.new(
      voter_id: current_user.id,
      post_id: params[:id],
      value: value
      )

    unless new_vote.save
      old_vote = Vote.find_by(voter_id: current_user.id, post_id: params[:id])
      old_vote.destroy
      new_vote.save
    end
  end

  if post.post_type == "question"
    redirect "/posts/#{post.id}"
  else
    redirect "/posts/#{post.question.id}"
  end
end
