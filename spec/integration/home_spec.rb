require 'rails_helper'

RSpec.describe 'Home', type: :system do
  describe 'index page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Sign Up')
      expect(page).to have_content('Sign In')
    end
  end
end
