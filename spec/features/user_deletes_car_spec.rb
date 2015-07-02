require 'rails_helper'

feature "user deletes an existing car", %Q{
  As a user,
  I want to delete a car.
} do

  describe "\n delete car from its show page" do
    let!(:car) { FactoryGirl.create(:car) }

    scenario "from the show page" do
      visit cars_path

      click_on "Delete"

      expect(page).to have_content("Car deleted successfully.")
      expect(Car.count).to eq(0)
    end
  end
end
