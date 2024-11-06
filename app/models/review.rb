class Review
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :rating, type: Integer

  # Asosiasi dengan user dan course
  belongs_to :user
  belongs_to :course

  # Validasi
  validates :rating, inclusion: { in: 1..5, message: "Rating harus antara 1 hingga 5" }
  validates :content, presence: true
end
