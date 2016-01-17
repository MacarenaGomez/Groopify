class Pet < ActiveRecord::Base

  validates :name, :species,  presence: true
  validates :age, numericality: {only_integer: true, greater_than: -1}

  belongs_to :user
end
