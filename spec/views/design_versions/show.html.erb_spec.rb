require 'spec_helper'

describe "design_versions/show" do
  before(:each) do
    @design_version = assign(:design_version, stub_model(DesignVersion))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
