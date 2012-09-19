require 'spec_helper'

describe "ExperimentPages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "experiment creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a experiment" do
        expect { click_button "Submit" }.not_to change(Experiment, :count)
      end

      describe "error messages" do
        before { click_button "Submit" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'experiment_description', with: "Lorem ipsum" }
      before { fill_in 'experiment_input_file', with: "lorem" }
      it "should create a experiment" do
        expect { click_button "Submit" }.to change(Experiment, :count).by(1)
      end
    end
  end

  describe "experiment destruction" do
    before { FactoryGirl.create(:experiment, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a experiment" do
        expect { click_link "delete" }.to change(Experiment, :count).by(-1)
      end
    end
  end
end
