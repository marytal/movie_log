class UploadedImage < ActiveRecord::Base
  has_one :user
  belongs_to :movie
end
