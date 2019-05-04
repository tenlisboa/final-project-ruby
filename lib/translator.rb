require "rest-client"
require_relative "response"

class Translator
    attr_reader :url
    attr_reader :token

    def initialize
        @url = 'https://translate.yandex.net/api/v1.5/tr.json/translate'
        @token = 'trnsl.1.1.20190504T005259Z.97a7b4daf775b02e.6244e1ede3bf90708704889061e2856c40eb9095'
    end

    def translate(from, to, text)
        body = {text: text, lang: "#{from}-#{to}"}
        return Response.new(send_post(body))
    end

    private
    def send_post(body)
        return RestClient.post("#{@url}?key=#{@token}", body)
    end
end
