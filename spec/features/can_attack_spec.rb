require 'spec_helper'

feature "Attacking" do
  scenario "attacking Player 2" do
    sign_in_and_play
    click_button "Scratch"
    expect(page).to have_content "Lanie attacked Ada"
  end

  scenario "reduces Player 2's hit points by random number" do
    srand(67809)
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content "Ada: 50 HP"
    expect(page).to have_content "Ada: 48 HP"
  end

  scenario "Player 1 attacked by Player 2" do
    sign_in_and_play
    attack_and_confirm
    click_button "Scratch"
    expect(page).to have_content "Ada attacked Lanie"
  end

  scenario "reduces Player 1's hit points by random number" do
    srand(67809)
    sign_in_and_play
    2.times { attack_and_confirm }
    expect(page).not_to have_content "Lanie: 50 HP"
    expect(page).to have_content "Lanie: 49 HP"
  end

end
