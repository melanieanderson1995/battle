feature "allows game over" do
  context "if player 1 reach 0 hp first it shows game over" do
    before do
      sign_in_and_play
      attack_and_confirm
      #allow(Kernel).to receive(:rand).and_return(100)
    end

    scenario "Player 1 loses" do
      click_button "Scratch"
      expect(page).to have_content "Lanie loses!"
    end
  end
end
