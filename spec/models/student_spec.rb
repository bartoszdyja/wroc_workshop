require 'rails_helper'

RSpec.describe Student do
  describe 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
  end

  describe 'database columns' do
    it { should have_db_column :first_name }
    it { should have_db_column :last_name }
  end

  describe 'associations' do
    it { is_expected.to have_many :subject_items }
    it { is_expected.to have_many :subject_item_notes }
    it { is_expected.to have_many :participations }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for :subject_items }
  end

  describe 'callbacks' do
    it 'should create account' do
      @student = Student.new(first_name: 'a', last_name: 'b')
      expect(@student).to receive(:initialize_account)
      @student.save
    end
  end
end
