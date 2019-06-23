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
    uri = URI("https://api.sheety.co/6110fffb-76e4-4d8f-9ca1-b27e2c31da26")
    body = Net::HTTP.get(uri)
    JSON.parse(body)
  end
end
