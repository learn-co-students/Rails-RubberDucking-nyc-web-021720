class Student < ApplicationRecord
    has_many :ducks

    validates :name, presence: true
    validates :mod, inclusion: [1,2,3,4,5]
end
