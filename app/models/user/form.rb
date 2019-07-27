class User::Form < ActiveType::Record[User]
  def name=(name)
    self.first_name, self.last_name = name.split(' ').values_at(0, -1)
  end

end
