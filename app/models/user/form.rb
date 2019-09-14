class User::Form < ActiveType::Record[User]
  def name=(name)
    names = name.split(' ')
    self.first_name = names[0]
    self.last_name = names[-1] if names.count > 1
  end
end
