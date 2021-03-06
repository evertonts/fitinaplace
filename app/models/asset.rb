class Asset < ActiveRecord::Base
  has_attached_file :image, :styles => {
    :thumb => '150x150',
    :medium => '300x300',
    :large => '600x600'
  },:default_url => '/assets/notFound.png'
end
