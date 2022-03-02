class Company < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :telephone

    validates_length_of :email, minimum: 5
    validates_length_of :name, maximum: 70
    validates_length_of :telephone, minimum: 8, maximum: 18
end
