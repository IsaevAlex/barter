require 'spec_helper'

describe Service do
  before { @service = Service.new(content: "Example service") }
  subject { @service }

  it { should respond_to(:content) }

  describe "when content is not present" do
    before { @service.content = " " }
    it { should_not be_valid }
  end

  describe "when content is too long" do
    before { @service.content = "a" * 1001 }
    it { should_not be_valid }
  end
  
  describe "when content is too short" do
    before { @service.content = "a" * 9 }
    it { should_not be_valid }
  end
  
end