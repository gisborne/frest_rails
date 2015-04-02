require 'rails_helper'

RSpec.describe "namespaces/edit", type: :view do
  before(:each) do
    @namespace = assign(:namespace, Namespace.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit namespace form" do
    render

    assert_select "form[action=?][method=?]", namespace_path(@namespace), "post" do

      assert_select "input#namespace_name[name=?]", "namespace[name]"

    end
  end
end
