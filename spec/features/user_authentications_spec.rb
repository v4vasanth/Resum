require 'rails_helper'
require 'helpers/test_helper'

RSpec.feature "UserAuthentications", type: :feature do

  scenario "user signs up/ sign in" do
  	initialize_account
  end

  scenario "simple flow", js: true do
  	initialize_account
    fill_basic(build(:basic))
    add_education([build(:education), build(:education), build(:education)])
    add_project([build(:project), build(:project)])
    breakpoint
    add_experience([build(:experience), build(:experience)])
    add_skill([build(:skill), build(:skill)])
  end

end
