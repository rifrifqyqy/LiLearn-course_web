class Course
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :thumbnail, type: String  
  field :description, type: String

   # Asosiasi dengan materials
   has_many :materials, dependent: :destroy
   accepts_nested_attributes_for :materials, allow_destroy: true
   # Pemasangan uploader thumbnail
   mount_uploader :thumbnail, ThumbnailUploader
   
end
