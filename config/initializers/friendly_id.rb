FriendlyId.defaults do |config|
  config.base = :name
  config.use :sequentially_slugged, :finders
  config.use Module.new do
    def normalize_friendly_id(input)
      super input.to_s.gsub("\'", "").to_slug.truncate(150).normalize.to_s
    end
  end

  config.sequence_separator = '--'
end
