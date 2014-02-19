# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  item_id    :integer
#  user_id    :integer
#  notes      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Favorite do
  pending "add some examples to (or delete) #{__FILE__}"
end
