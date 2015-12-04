class SubjectItem < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :students, through: :participations
  has_many :subject_item_notes, dependent: :destroy

  belongs_to :teacher

  validates :title, presence: true

  scope :not_assigned_or_assigned_to_teacher, -> (teacher) { where('teacher_id IS ? or teacher_id = ?', nil, teacher) }

  def to_partial_path
    'reports/subject_item'
  end

end
