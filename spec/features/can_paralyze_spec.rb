feature "paralyzing" do
  scenario "paralyzing player 2" do
    sign_in_and_play
    click_button "Paralyze"
    expect(page).to have_content "Lanie paralyzed Ada"
  end

  scenario "Player 2 skips turn" do
    sign_in_and_play
    paralyze_and_confirm
    expect(page).to have_content "they can't move"
  end
end
