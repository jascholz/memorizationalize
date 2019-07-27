class User::Form < ActiveType::Record[User]

  def name
    [first_name, last_name].join(' ')
  end

  def name=(name)
    this.first_name, this.last_name = name.split(' ').values_at(0, -1)
  end

end
