require 'gds_api/publishing_api'

Whitehall.publishing_api_client = GdsApi::PublishingApi.new(
  Plek.find('publishing-api')
)
