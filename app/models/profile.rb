class Profile < ActiveRecord::Base

  ## VALIDATIONS ##
  validates :nickname, :dob, :phone, presence: true

  ## ASSOCIATIONS ##
  belongs_to :user

end
