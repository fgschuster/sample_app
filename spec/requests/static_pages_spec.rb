require 'spec_helper'

describe "Static pages" do

	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  it "should have the right links in the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to have_title(full_title(''))
    click_link "Sign in"
    expect(page).to have_title(full_title('Sign in'))
  end

	subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)     {'Sample App' }
    let(:page_title)  {''}

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sin amet")
        #FactoryGirl.create(:micropost, user: user, content: "Dolor sin amet2")
        #FactoryGirl.create(:micropost, user: user, content: "Dolor sin amet3")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "micropost pagination" do
        before do
          30.times { FactoryGirl.create(:micropost, user: user) }
          visit root_path
        end
        after(:all)   { User.delete_all }

        it "should list each micropost" do
          Micropost.paginate(page: 1).each do |micropost|
            expect(page).to have_selector('li', text: micropost.content)
          end
        end
      end

    end

    describe "sidebar - for sigend-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "sidebar - no microposts" do
        before do
          sign_in user
          visit root_path
        end
        it { should have_content("0 microposts") }
      end

      describe "sidebar - 1 micropost" do
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
          sign_in user
          visit root_path
        end
        it { should have_content("1 micropost") }
      end

      describe "sidebar - multiple microposts" do
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
          FactoryGirl.create(:micropost, user: user, content: "Dolor sin amet")
          sign_in user
          visit root_path
        end
        it { should have_content("2 microposts") }
      end


    end
 	end

	describe "Help page" do
    before { visit help_path}
    let(:heading)     {'Help' }
    let(:page_title)  {'Help' }

    it_should_behave_like "all static pages"
 	end

 	describe "About page" do
    before { visit about_path }
    let(:heading)     {'About Us' }
    let(:page_title)  {'About' }

    it_should_behave_like "all static pages"
 	end
 	
 	describe "Contact page" do
    before { visit contact_path }
    let(:heading)     {'Contact' }
    let(:page_title)  {'Contact' }

    it_should_behave_like "all static pages"
 	end

end
