require 'spec_helper'

feature 'User creates student' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    click_on 'Add new one'
  end

  scenario 'with valid input' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
    end

  context 'with valid name and birthdate' do
    before do
      fill_in 'First name', with: 'Adrian'
      fill_in 'Last name', with: 'Nowacki'
      fill_in 'Birthdate', with: '2010-01-01'
      click_button 'Create Student'
    end
    
    it 'creates student' do
      expect(page).to have_content 'Student has been created!'
      expect(page).to have_content '2010-01-01'
    end

    it 'creates default acccount' do
      visit report_accounts_path
      expect(page).to have_content 'Adrian'
      expect(page).to have_content Date.today+1.month
    end
  end

  scenario 'with missing first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end
end
