require 'rails_helper'

describe UsersController do
  context "GET #index" do
    let(:user) { FactoryGirl.create(:user) }

    it "should return all users" do
      expect(User).to receive(:all).and_return([user])
      get :index
      expect(response).to be_success
      expect(response).to render_template("index")
    end

    context "GET #new" do
       let(:user) { FactoryGirl.build(:user) }

      it "should initialize a new user" do
        expect(User).to receive(:new).and_return([user])
        get :new
        expect(response).to be_success
        expect(response).to render_template("new")
      end
    end

    context "POST #create" do
      let(:user) { FactoryGirl.create(:user) }

      it "should save a new user" do
        expect(User).to receive(:new).and_return(user)
        expect(user).to receive(:save).and_return(true)
        post :create, user: {name: "Damilola adebayo", email: "dami3624@yahoo.com"}
        expect(response).to be_redirect
        expect(response).to redirect_to(users_path)
      end

      it "should return errors with invalid data" do
        expect(User).to receive(:new).and_return(user)
        expect(user).to receive(:save).and_return(false)
        post :create, user: {name: "", email: ""}
        expect(response).to be_success
        expect(response).to render_template("new")
      end
    end
  end
end