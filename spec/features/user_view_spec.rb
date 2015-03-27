require 'rails_helper'

RSpec.describe 'The User View', type: :feature do
  let(:cohort) { Cohort.create(name: '1402') }
  let(:user) { User.create(name: 'Jeffrey Gu', cohort_id: cohort.id, avatar: 'https://avatars.githubusercontent.com/u/5934106?v=3' ) }

  it 'should display the users name and picture' do
    visit user_path(user)
    expect(page).to have_content(user.name)
    expect(page.find('#avatar')['src']).to have_content(user.avatar)
  end
end
