# == Schema Information
#
# Table name: groups
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  admin         :integer
#  created_at    :datetime
#  updated_at    :datetime
#  current_order :integer
#

require 'spec_helper'

describe Group do
  pending "add some examples to (or delete) #{__FILE__}"
end