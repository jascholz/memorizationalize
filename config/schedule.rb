every 1.day, at: '2:30 am' do
  runner 'User::Runner.delete_unconfirmed_users'
end
