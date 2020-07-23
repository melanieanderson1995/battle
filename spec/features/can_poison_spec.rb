feature "poisoning" do
  scenario "player 2 is poisoned" do
    sign_in_and_play
    click_button "Catnip"
    expect(page).to have_content "Lanie gave Ada catnip"
  end
end
