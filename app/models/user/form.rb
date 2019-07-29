class User::Form < ActiveType::Record[User]
  after_create :setup

  def name=(name)
    self.first_name, self.last_name = name.split(' ').values_at(0, -1)
  end

  private

  def setup
    category = Category.create!(name: 'Erste Kategorie', priority: 1)
    category_mappings.create!(category: category)

    calendar = Calendar.create!(creator: self, category: category, name: 'Erster Kalender')
  end

end
