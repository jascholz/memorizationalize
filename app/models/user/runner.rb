class User::Runner
  def self.delete_unconfirmed_users
    User.where(confirmed: false).where('created_at < ?', 1.week.ago).delete_all
  end
end
