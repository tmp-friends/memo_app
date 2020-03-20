class Post < ApplicationRecord
    validates :title, {presence: true, length: {maximum: 40}}
    with_options length: {maximum: 140} do
        validates :fact 
        validates :abstraction
        validates :diversion
    end
    validates :user_id, {presence: true}

    def user
        return User.find_by(id: self.user_id)
    end
end
