module UserHelper
    def create_user(overrides = {})
        name = overrides.fetch(:name) { Faker::Name.unique.name }
        User.create({ name: name }.merge(overrides))
    end
end