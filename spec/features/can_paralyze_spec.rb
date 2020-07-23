feature "paralyzing" do
  scenario "paralyzing player 2" do
    sign_in_and_play
    click_button "Puff up"
    expect(page).to have_content "Lanie scared Ada"
  end
end
