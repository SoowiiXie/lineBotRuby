 class EventProcessor
  def process(text)
    call_sheety_api.each do |data|
      if data["keyword"].to_s == text
        return {  
          "type": "text",
          "text": data["message"].to_s
        }
      end
    end
    return nil
  end

  def call_sheety_api
    uri = URI("https://api.sheety.co/2107c80d-5c37-41e2-87c2-a4c7bdee477f")
    body = Net::HTTP.get(uri)
    JSON.parse(body)
  end
end
