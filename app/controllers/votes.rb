post '/posts/:id/votes' do
  value = params[:value] == 'up' ? 1 : -1
  Vote.create(
    voter_id: current_user.id,
    post_id: params[:id],
    value: value
    )
end
