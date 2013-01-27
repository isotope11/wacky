require 'spec_helper_without_rails'
require_relative '../../app/models/wacky/extracts_title'

describe ExtractsTitle do
  it "extracts the first heading element from a string" do
    good_string = "This is a <h2>Header is here</h2> weird html document"
    ExtractsTitle.new(good_string).title.must_equal "Header is here"
  end

  it "returns nil if no heading elements were found" do
    empty_title = "Nope"
    ExtractsTitle.new(empty_title).title.must_equal nil
  end
end
