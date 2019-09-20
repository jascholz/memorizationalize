every 1.day, at: '2:12 am' do
  runner 'User::Runner.delete_unconfirmed_users'
end

every 1.day, at: '2:15 am' do
  runner 'Drawer::Invitation.expire_invitations'
end
