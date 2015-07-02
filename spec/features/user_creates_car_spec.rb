require 'rails_helper'

feature "user creates a new car", %{
  As a user,
  I want to create a car.
} do

  describe "complete new Car form" do
    let!(:manufacturer) { FactoryGirl.create(:manufacturer) }

    scenario "\n inputs are valid" do
      visit new_car_path

      fill_in "Year", with: 1933
      fill_in "Color", with: "Ruby Red"
      fill_in "Mileage", with: 3
      select "Tesla", from: "Manufacturer"
      fill_in "Description", with: "Thing of beauty."

      click_on "Submit"

      expect(page).to have_content("Car created successfully.")
    end

    scenario "\n inputs are invalid" do
      visit new_car_path

      fill_in "Year", with: nil
      fill_in "Color", with: ""
      fill_in "Mileage", with: ""
      fill_in "Description", with: ""

      click_on "Submit"

      expect(page).to have_content("Yikes!")
      expect(page).to have_content("errors")
      expect(page).to have_content("Please fix")
    end
  end
end
