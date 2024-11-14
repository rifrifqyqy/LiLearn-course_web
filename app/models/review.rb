class Review
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :rating, type: Integer
  field :user_id, type: BSON::ObjectId
  field :course_id, type: BSON::ObjectId
  # Asosiasi dengan user dan course
  belongs_to :user
  belongs_to :course

  # Validasi
  validates :rating, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :content, presence: true
  validates :user_id, presence: true
  validates :course_id, presence: true
end
