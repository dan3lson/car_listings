require 'rails_helper'

feature "user deletes an existing manufacturer", %Q{
  As a user,
  I want to delete a manufacturer.
} do

  describe "\n delete manufacturer from its show page" do
    let!(:manufacturer) { FactoryGirl.create(:manufacturer) }

    scenario "from the show page" do
      visit manufacturers_path

      click_on "Delete"

      expect(page).to have_content("Manufacturer deleted successfully.")
      expect(Manufacturer.count).to eq(0)
    end
  end
end
