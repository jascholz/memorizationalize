module Shared::DoesIndestructible
  as_trait do
    before_destroy do
      throw :abort
    end
  end
end
