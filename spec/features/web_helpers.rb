def sign_in_and_play
  visit("/")
  fill_in :player_1_name, with: "Lanie"
  fill_in :player_2_name, with: "Ada"
  click_button "Submit"
end

def attack_and_confirm
  click_button "Scratch"
  click_button "OK"
end

def paralyze_and_confirm
  click_button "Puff up"
  click_button "OK"
end

def sleep_and_confirm
  click_button "Cat nap"
  click_button "OK"
end

def poison_and_confirm
  click_button "Catnip"
  click_button "OK"
end
