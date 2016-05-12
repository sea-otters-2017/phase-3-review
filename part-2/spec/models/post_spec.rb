require_relative "../spec_helper"

describe Post do
  let(:valid_post_attributes) { {body: "This is what I have to say.", hometown: "Oakland", guest_name: "John Locke"} }
  let(:post) { Post.new(valid_post_attributes) }

  describe "the body" do
    it "is required" do
      no_body_attributes = valid_post_attributes.merge(body: nil)
      bodyless_post = Post.new(no_body_attributes)
      expect(bodyless_post).to_not be_valid
    end

    it "can be set" do
      expect(post.body).to eq "This is what I have to say."
    end
  end

  describe "the guest name" do
    it "is required" do
      no_guest_name_attributes = valid_post_attributes.merge(guest_name: nil)
      nameless_post = Post.new(no_guest_name_attributes)
      expect(nameless_post).to_not be_valid
    end

    it "can be set" do
      expect(post.guest_name).to eq "John Locke"
    end

  end

  describe "the hometown" do
    it "defaults to unknown if nil" do
      no_hometown_attributes = valid_post_attributes.merge(hometown: nil)
      townless_post = Post.new(no_hometown_attributes)
      expect(townless_post.hometown).to eq "unknown"
    end

    it "defaults to unknown if empty" do
      empty_hometown_attributes = valid_post_attributes.merge(hometown: "")
      empty_hometown_post = Post.new(empty_hometown_attributes)
      expect(empty_hometown_post.hometown).to eq "unknown"
    end

    it "defaults to unknown if not given at all" do
      no_hometown_key_attributes = {body: "Loved it here.", guest_name: "Peter"}
      no_hometown_key_post = Post.new(no_hometown_key_attributes)
      expect(no_hometown_key_post.hometown).to eq "unknown"
    end

    it "can be set" do
      expect(post.hometown).to eq "Oakland"
    end
  end
end
