# == Schema Information
#
# Table name: experiments
#
#  id          :integer          not null, primary key
#  description :string(255)
#  input_file  :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Experiment do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @experiment = user.experiments.build( description:  "Lorem ipsum",
                                          input_file:   "input")
  end

  subject { @experiment }

  it { should respond_to(:description) }
  it { should respond_to(:input_file) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @experiment.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Experiment.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
