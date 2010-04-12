require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe "Project Model" do
  it 'can be created' do
    @project = Project.new
    @project.should_not be_nil
  end
end
