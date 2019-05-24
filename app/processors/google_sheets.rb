class EventProcessor
  def self.process(text)
    call_sheety_api.each do |data|
      if data["keyword"] == text
        return {  
          "type": "text",
          "text": data["message"]
        }
      end
    end
    return nil
  end

  private

  def self.call_sheety_api
    uri = URI("https://api.sheety.co/0b69f89c-6d55-4413-bde5-0b0d91b2627e")
    body = Net::HTTP.get(uri)
    JSON.parse(body)
  end
end