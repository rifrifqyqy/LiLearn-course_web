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
   # Asosiasi dengan reviews
   has_many :reviews, dependent: :destroy
   accepts_nested_attributes_for :reviews, allow_destroy: true

   # Menghitung rata-rata rating menggunakan agregasi Mongoid
  def average_rating
    return '' if reviews.empty?
  
    # Gunakan aggregate pada koleksi Review untuk menghitung rata-rata
    result = Review.collection.aggregate([
      { "$match" => { "course_id" => self.id } },
      { "$group" => { "_id" => nil, "avg_rating" => { "$avg" => "$rating" } } }
    ])
  
    # Ambil hasil rata-rata dan bulatkan jika diperlukan
    avg_rating = result.first ? result.first['avg_rating'] : 0
    # Jika rata-rata adalah bilangan bulat, kembalikan sebagai integer
    avg_rating.to_i == avg_rating ? avg_rating.to_i : avg_rating.round(1)
  end
  
end
