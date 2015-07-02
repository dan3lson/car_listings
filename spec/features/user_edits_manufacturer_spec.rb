require 'rails_helper'

feature "user edits a manufacturer", %Q{
  As a user,
  I want to edit one of my manufacturers.
} do

  let!(:manufacturer) {FactoryGirl.create(:manufacturer) }

  describe "edit a Manufacturer form" do
    scenario "\n updates are valid" do
      visit manufacturers_path
      click_on "Edit"

      fill_in "Name", with: "Tesla"
      fill_in "Country", with: "USA"

      click_on "Submit"

      expect(page).to have_content("Manufacturer edited successfully.")
      expect(page).not_to have_content("Manufacturer not edited successfully.")
    end

    scenario "\n updates are invalid" do
      visit manufacturers_path
      click_on "Edit"

      fill_in "Name", with: ""
      fill_in "Country", with: ""

      click_on "Submit"

      expect(page).to have_content("Manufacturer not edited successfully.")
      expect(page).to have_content("Yikes!")
      expect(page).to have_content("errors")
      expect(page).to have_content("Please fix")
    end
  end
end
