class User::Runner
  def self.delete_unconfirmed_users
    p User.where(confirmed: false)
    User.where(confirmed: false).delete_all
  end
end
