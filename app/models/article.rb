class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  has_many :attachments

  # rubocop: disable Style/SymbolProc, Lint/UselessAssignment
  def tag_list
    tags.collect do |tag|
      tag.name
    end.join(', ')
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(',').collect { |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    tag = new_or_found_tags
  end
  # rubocop: enable Style/SymbolProc, Lint/UselessAssignment
end
