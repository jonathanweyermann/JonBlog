feature "User index (Reports)", js: true do
  let(:section) { FactoryGirl.create(:section) }

  before(:each) do
    login_as(section.profile, :scope => :profile, :run_callbacks => false)
    create_quiz
    take_quiz
    visit admin_users_path
  end



  def create_quiz

  end

  def take_quiz

  end

end
