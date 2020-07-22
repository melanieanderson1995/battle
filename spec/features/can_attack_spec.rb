require 'spec_helper'

feature "Attacking" do
  scenario "attacking Player 2" do
    sign_in_and_play
    click_button "Scratch"
    expect(page).to have_content "Lanie attacked Ada"
  end

  scenario "reduces Player 2's hit points by 10" do
    sign_in_and_play
    attack_and_confirm
    expect(page).not_to have_content "Ada: 50 HP"
    expect(page).to have_content "Ada: 40 HP"
  end

  scenario "Player 1 attacked by Player 2" do
    sign_in_and_play
    attack_and_confirm
    click_button "Scratch"
    expect(page).to have_content "Ada attacked Lanie"
  end

  scenario "reduces Player 1's hit points by 10" do
    sign_in_and_play
    2.times { attack_and_confirm }
    expect(page).not_to have_content "Lanie: 50 HP"
    expect(page).to have_content "Lanie: 40 HP"
  end
=begin
  context "when dealing random damage" do
    scenario "reduce Player 2 HP by random amount" do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content "Ada: 50 HP"
    end

    scenario "reduce Player 1 HP by random amount" do
      sign_in_and_play
      2.times { attack_and_confirm }
      expect(page).not_to have_content "Lanie: 50 HP"
    end
  end
=end
end
