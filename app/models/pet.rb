class Pet < ActiveRecord::Base

  validates :name, :species,  presence: true
  validates :age, numericality: {only_integer: true, greater_than: -1}
  validates :species, inclusion: { in: ['Perro', 'Gato', 'Rata', 'Chinchilla', 'Otros']}

  belongs_to :user

  has_attached_file :image, styles: { medium: "250x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
