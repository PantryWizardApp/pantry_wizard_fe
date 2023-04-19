require 'rails_helper'

describe 'As a user, when I visit /preferences page' do
  before :each do
    current_user = {"google_id"=>"106048413854356122337",
    "name"=>"Conner Van Loan",
    "email"=>"cdvanloan@gmail.com",
    "id"=>1,
    "intolerances"=>nil,
    "likes"=>nil,
    "dislikes"=>nil,
    "dietary_restrictions"=>nil}

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

    VCR.use_cassette('user_dashboard') do
      visit '/dashboard'
    end
  end
  
  it 'displays a form that a user can select from to edit their preferences' do
    VCR.use_cassette('user_preference_edit_spec') do
     click_link "Edit My Preferences"
    end
    expect(current_path).to eq("/preferences")
    expect(page).to have_content("Edit Your Preferences")
    expect(page).to have_content("Intolerances")
  end
  
  it 'allows a user to make selections and save them' do
    VCR.use_cassette('user_preference_edit_spec') do
     click_link "Edit My Preferences"
    end

    within("#intolerances") do
      check("dairy")
    end
    
    vegan_radio = find("input[type='radio'][value='Vegan']")
    vegan_radio.click

    chinese_select = find("select[name='user[cuisines][chinese][]']")
    chinese_select.select("Like")

    irish_select = find("select[name='user[cuisines][irish][]']")
    irish_select.select("Dislike")

    VCR.use_cassette('user_editted_preferences') do
      click_button "Save Preferences"
    end

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Preferences Updated!")
  end
end 