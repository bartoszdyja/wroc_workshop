class Account < ActiveRecord::Base
  belongs_to :student

  validates_presence_of :balance, :payment_date

  def to_partial_path
    'reports/account'
  end
end
