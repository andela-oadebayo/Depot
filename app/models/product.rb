class Product < ActiveRecord::Base

  ## VALIDATIONS ##
  validates :name, :description, :price, presence: true
  validates :price, numericality: {allow_blank: true}
  has_attached_file :image, styles: {meduim: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
