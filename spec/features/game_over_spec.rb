feature "allows game over" do
  context "if player 2 reach 0 hp first it shows game over" do
    before do
      sign_in_and_play
      attack_and_confirm
      allow(Kernel).to receive(:rand).and_return(100)
    end

    scenario "Player 2 loses" do
      sign_in_and_play
      9.times { attack_and_confirm }
      click_button "Scratch"
      expect(page).to have_content "Ada loses!"
    end
  end
end
