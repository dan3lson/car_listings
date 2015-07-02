require 'rails_helper'

feature "user creates a new manufacturer", %{
  As a user,
  I want to create a manufacturer.
} do

  describe "complete new Manufacturer form" do
    scenario "\n inputs are valid" do
      visit new_manufacturer_path

      fill_in "Name", with: "Tesla"
      fill_in "Country", with: "USA"

      click_on "Submit"

      expect(page).to have_content("Manufacturer created successfully.")
    end

    scenario "\n inputs are invalid" do
      visit new_manufacturer_path

      fill_in "Name", with: ""
      fill_in "Country", with: ""

      click_on "Submit"

      expect(page).to have_content("Manufacturer not created successfully.")
      expect(page).to have_content("Yikes!")
      expect(page).to have_content("errors")
      expect(page).to have_content("Please fix")
    end
  end
end
