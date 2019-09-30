require "aws-sdk"
Aws.config = {stub_responses: true}


feature "add portfolio chunk" do
  let(:portfolio) { FactoryGirl.create(:portfolio)}
  let(:user) { FactoryGirl.create(:user)}

  before(:each) do
    login_as(user, :scope => :user, :run_callbacks => false)
    visit admin_portfolios_path(portfolio)
  end

  context "portfolio show" do
    before(:each) do
      within('.hidden-sm') do
        click_link("View")
      end

    end

    it "adds a chunk" do
      add_china

      expect(page).to have_content("world's most populous country")
      expect(page).to have_content("Portfolio piece Created")
    end

    it "adds another chunk" do
      add_china
      add_japan

      expect(page).to have_content("world's most populous country")
      expect(page).to have_content("island country in East Asia")
      expect(page).to have_content("Portfolio piece Created")
    end

    it "views the text on the front end" do
      add_china
      add_japan

      visit root_path
      expect(page).to have_content("world's most populous country")

    end

    it "unpublishes the portfolio, making it invisible to a visitor" do
      add_china
      add_japan

      visit admin_portfolios_path

      within('.hidden-sm') do
        click_link 'pubed'
      end

      visit root_path
      expect(page).to_not have_content("world's most populous country")
    end
  end

  def add_china
    fill_in 'portfolio_chunk_name', with: 'China'
    fill_in 'portfolio_chunk_description', with: "China, officially the People's Republic of China, is a country in East Asia and the world's most populous country, with a population of around 1.404 billion in 2017. Covering approximately 9,600,000 square kilometers, it is the third or fourth largest country by total area"

    click_button("Submit")
  end

  def add_japan
    fill_in 'portfolio_chunk_name', with: 'Japan'
    fill_in 'portfolio_chunk_description', with: "Japan is an island country in East Asia. Located in the Pacific Ocean, it lies off the eastern coast of the Asian continent and stretches from the Sea of Okhotsk in the north to the East China Sea and the Philippine Sea in the south."

    click_button("Submit")
  end

end
