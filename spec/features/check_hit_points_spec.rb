require 'spec_helper'

feature "Check hit points" do
  scenario "See Player 2's hit points" do
    visit("/")
    fill_in :player_1_name, with: "Lanie"
    fill_in :player_2_name, with: "Ada"
    click_button "Submit"
    expect(page).to have_content "Ada: 50 HP"
  end
end
