require 'rails_helper'

feature "user edits a car", %Q{
  As a user,
  I want to edit one of my cars.
} do


  describe "edit a Car form" do
    let!(:car) {FactoryGirl.create(:car) }

    scenario "\n updates are valid" do
      visit cars_path

      click_on "Edit"

      fill_in "Year", with: 2033
      fill_in "Color", with: "Midnight Black"
      fill_in "Mileage", with: 3
      select "Tesla", from: "Manufacturer"
      fill_in "Description", with: "Thing of beauty."

      click_on "Submit"

      expect(page).to have_content("Car edited successfully.")
    end

    scenario "\n updates are invalid" do
      visit cars_path

      click_on "Edit"

      fill_in "Year", with: nil
      fill_in "Mileage", with: ""
      fill_in "Color", with: ""
      select "", from: "Manufacturer"
      fill_in "Description", with: ""

      click_on "Submit"

      expect(page).to have_content("Car not edited successfully.")
      expect(page).to have_content("Yikes!")
      expect(page).to have_content("errors")
      expect(page).to have_content("Please fix")
    end
  end
end
