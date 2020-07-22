require 'spec_helper'

feature "Check hit points" do
  scenario "See Player 2's hit points" do
    sign_in_and_play
    expect(page).to have_content "Ada: 50 HP"
  end

  scenario "See Player 1's hit points" do
    sign_in_and_play
    expect(page).to have_content "Lanie: 50 HP"
  end
end
