class Report < ApplicationRecord
  belongs_to :resident

  validates_presence_of :content
end
