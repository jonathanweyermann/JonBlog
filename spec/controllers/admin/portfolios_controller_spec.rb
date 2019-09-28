require "aws-sdk"
Aws.config = {stub_responses: true}

describe Admin::PortfoliosController do

  context "logging in" do
    it "blocks unauthenticated access" do
      sign_in nil
      get :index

      expect(response).to redirect_to(new_user_session_path)
    end

    it "allows authenticated access" do
      sign_in
      get :index

      expect(response).to be_success
    end
  end
  context "logged in" do
    before (:each) { sign_in }

    it "should allow viewing of index page" do
      get :index

      expect(response).to render_template("index")
    end

    it "should redirect to index with successful creation" do
      post :create, portfolio: FactoryGirl.attributes_for(:portfolio)

      expect(assigns[:exposed_portfolio]).to_not be_new_record
      expect(flash[:notice]).to eq("Portfolio piece Created")
      expect(response).to redirect_to(admin_portfolios_path)
    end

    it "should redraw the new index page on failure" do
      allow_any_instance_of(Portfolio).to receive(:valid?).and_return(false)
      post :create, portfolio: FactoryGirl.attributes_for(:portfolio)

      expect(assigns[:exposed_portfolio]).to be_new_record
      expect(flash[:notice]).to be_nil
      expect(response).to render_template("new")
    end
  end

end
