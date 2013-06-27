# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  street          :string(255)
#  house_number    :integer
#  created_at      :datetime
#  updated_at      :datetime
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#  group_id        :integer
#

require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end
