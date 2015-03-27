require 'rails_helper'

describe SessionsController do

  describe "#create" do
    it "creates a user from github data" do
      @request.env["omniauth.auth"] = {
        'provider' => 'github',
        'info' => {'name' => 'Alice Smith',
                   'email' => 'alice@smith.com',
                   'image' => 'avatar.github.com'},
        'uid' => 'abc123',
        'credentials' => { 'token' => '22e37059' }
      }

      post :create
      user = User.find_by_uid_and_provider('abc123', 'github')
      expect(user.name).to eq("Alice Smith")
    end

    it "logs in an existing user" do
      @request.env["omniauth.auth"] = {
        'provider' => 'github',
        'info' => {'name' => 'Bob Jones'},
        'uid' => 'xyz456',
        'credentials' => { 'token' => '22e37059' }
      }
      user = User.create(provider: 'github', uid: 'xyz456', name: 'Bob Jones')

      post :create
      expect(User.count).to eq(1)
      expect(controller.current_user.id).to eq(user.id)
    end

    it 'redirects to the users profile page' do
      request.env["omniauth.auth"] = {
        'provider' => 'github',
        'info' => {'name' => 'Charlie Allen'},
        'uid' => 'prq987',
        'credentials' => { 'token' => '22e37059' }
      }
      user = User.create(provider: 'github', uid: 'prq987', name: 'Charlie Allen')
      post :create
      expect(response).to redirect_to(user_path(user))
    end
  end

end
