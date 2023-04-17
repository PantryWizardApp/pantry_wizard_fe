require 'rails_helper'

describe 'As a user, when I visit /preferences page' do
  before :each do
    current_user = {"google_id"=>"106048413854356122337",
    "name"=>"Conner Van Loan",
    "email"=>"cdvanloan@gmail.com",
    "intolerances"=>nil,
    "likes"=>nil,
    "dislikes"=>nil,
    "dietary_restrictions"=>nil}

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

    VCR.use_cassette('user_preference_edit_spec') do
      visit '/dashboard'
      click_link "Edit My Preferences"
    end

  end

  it 'displays a form to edit my preferences' do
    expect(current_path).to eq("/preferences")
    expect(page).to have_content("Edit My Preferences")
    expect(page).to have_content("Intolerances")
    save_and_open_page
    within("#intolerances") do
      check("dairy")
      select('Vegan', from: "Diets")
    end
  end
end 