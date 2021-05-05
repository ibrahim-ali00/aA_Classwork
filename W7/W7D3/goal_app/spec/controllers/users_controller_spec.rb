require "rails_helper"

RSpec.describe UsersController, type: :controller do

    
  describe "GET #new" do
    it "should render sign up page" do
      get :new, {}
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    let(:valid_params) { { user: { username: "valid", password: "123456" } } }
    let(:invalid_params) { { user: { username: "invalid", password: "123" } } }
    context "with valid params" do
      it "log in the user and create" do
        post :create, params: valid_params
        user = User.find_by(username: "valid")
        expect(session[:session_token]).to eq(user.session_token)
      end
      it "redirects to right page" do
        post :create, params: valid_params
        expect(response).to redirect_to(user_url(User.last))
      end
    end

    context "with invalid params" do
      it "redirects to sign up page" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    subject(:user1) {User.create!(username: "User1", password: "abcdef")}
    it "renders show page" do
        get :show, params: {id: user1.id}
        expect(response).to render_template(:show)
    end

    it "redirects to user index if invalid" do
        get :show, params: {id: 100}
        expect(response).to redirect_to(users_url)
    end
  end
end
