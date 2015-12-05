class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy
  has_many :subject_items, through: :participations

  has_one :account, dependent: :destroy

  accepts_nested_attributes_for :subject_items

  after_create :initialize_account 

  validates :first_name, :last_name, presence: true

  def initialize_account
    Account.create!(payment_date: Date.today + 1.month, student:self)
  end
end
