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

class Experiment < ActiveRecord::Base
  attr_accessible :description, :input_file
  belongs_to :user

  validates :user_id, presence:true
end
