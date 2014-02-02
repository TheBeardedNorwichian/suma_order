# == Schema Information
#
# Table name: base_data
#
#  id            :integer          not null, primary key
#  category_name :string(255)
#  brand         :string(255)
#  code          :string(255)
#  description   :string(255)
#  details       :string(255)
#  size          :string(255)
#  price         :decimal(8, 2)
#  vat           :decimal(, )
#  rrp           :decimal(8, 2)
#  b             :boolean
#  f             :boolean
#  g             :boolean
#  o             :boolean
#  s             :boolean
#  v             :boolean
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe BaseData do

  before do
    @row = BaseData.new(category_name: "BLAH BLAH", brand: "blah", code: "123TEST",
                        description: "This is a description", details: "and these are the details",
                        size: "6 x 15", price: 50.00, vat: true, rrp: 5.45)
  end

  subject { @row }

  it { should respond_to(:category_name) }
  it { should respond_to(:brand) }
  it { should respond_to(:code) }
  it { should respond_to(:description) }
  it { should respond_to(:details) }
  it { should respond_to(:size) }
  it { should respond_to(:price) }
  it { should respond_to(:vat) }
  it { should respond_to(:rrp) }

  describe "when code is not present" do
    before { @row.code = "" }
    it { should_not be_valid }
  end

  describe "when price is not present" do
    before { @row.price = nil }
    it { should_not be_valid }
  end

end
