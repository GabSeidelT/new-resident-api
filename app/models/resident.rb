class Resident < ApplicationRecord
    has_many :reports
    has_many :bonds

    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :whatsapp
    validates_presence_of :initial_date
    validates_presence_of :final_date
    validates_presence_of :registration_id

    validates_length_of :name, maximum: 70
    validates_length_of :email, maximum: 255
    validates_length_of :registration_id, minimum: 8, maximum: 8
    validates_length_of :whatsapp, numerically:  true, minimum: 8, maximum: 18
end
