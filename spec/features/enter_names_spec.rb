require 'spec_helper'

feature 'Enter names' do
  scenario 'submitting names' do
    visit('/')
    fill_in :player_1_name, with: 'Lanie'
    fill_in :player_2_name, with: 'Ada'
    click_button 'Submit'
    expect(page).to have_content 'Lanie vs Ada'
  end
end
