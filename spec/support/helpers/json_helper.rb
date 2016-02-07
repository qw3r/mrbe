module Helpers
  module JsonHelper
    def json_response
      @json ||= JSON.parse(response.body)
    end
  end
end