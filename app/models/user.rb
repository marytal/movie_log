class User < ActiveRecord::Base
  has_many :uploaded_images

  validates_presence_of :email, :name, :password #not working, fix this.
  validates_uniqueness_of :email

  def validates_presence_of_password
    !!self.password
  end

  def password
    self.password_hash
  end

  def password=(_password)
    self.password_hash = Digest::SHA256.hexdigest(_password)
  end

  def self.find_by_email_and_password(email, _password)
    password_hash = Digest::SHA256.hexdigest(_password)
    self.where(email: email, password_hash: password_hash).first
  end
end
