require "spec_helper"

describe Admin::PostsHelper do
  describe "#remove_ext" do
    it "removes file extention from file name" do
      file = "this_is_a_file.jpg"
      remove_ext(file).should == "this_is_a_file"
    end
  end
end
