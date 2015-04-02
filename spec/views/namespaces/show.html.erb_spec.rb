require 'rails_helper'

RSpec.describe "namespaces/show", type: :view do
  before(:each) do
    @namespace = assign(:namespace, Namespace.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
