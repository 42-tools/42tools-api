Faraday.default_connection = Faraday.new(nil, {
  headers: {
    user_agent: "42Tools/1.0 Faraday/#{Faraday::VERSION}"
  }
})
