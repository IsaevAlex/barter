require 'spec_helper'

describe Order do
  before { @order = Order.new(description: "Example order") }
  subject { @order }

  it { should respond_to(:description) }

  describe "when description is not present" do
    before { @order.description = " " }
    it { should_not be_valid }
  end

  describe "when description is too long" do
    before { @order.description = "a" * 201 }
    it { should_not be_valid }
  end
  
  describe "when description is too short" do
    before { @order.description = "a" * 4 }
    it { should_not be_valid }
  end
  
end