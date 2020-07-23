feature "sleeping" do
  scenario "player 2 falls asleep" do
    sign_in_and_play
    click_button "Cat nap"
    expect(page).to have_content "Lanie put Ada to sleep"
  end
end
