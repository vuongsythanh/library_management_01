class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name, class_name: Author.name
  belongs_to :followed, class_name: User.name, class_name: Author.name
end
