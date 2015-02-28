class User < ActiveRecord::Base

  include ActiveModel::SecurePassword
  has_secure_password

  ## ASSOCIATIONS ##
  has_one :profile

  ## VALIDATIONS ##
  validates :name, :email, presence: true
  validates_associated :profile

  ## NESTED ATTRIBUTES ##
  accepts_nested_attributes_for :profile

  ## CALLBACKS ##
  before_validation :generate_temp_password, on: :create
  after_create :send_welcome_email

  ## INSTANCE METHODS ##

  ## PRIVATE METHODS ##
  private

  def generate_temp_password
    self.password = self.password_confirmation = SecureRandom.hex(4)
  end

  def send_welcome_email
    UserMailer.send_welcome_email(self, self.password).deliver
  end

end
