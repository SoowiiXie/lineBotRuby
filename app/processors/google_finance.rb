 class EventProcessor
  def process(text)
    call_sheety_api.each do |data|
      code = data["code"]
      name = data["name"]
      price = data["price"]
      if code == text || name == text
        return {  
          "type": "text",
          "text": "#{code} #{name}的當前價格為: #{price}"
        }
      end
    end
    return nil
  end

  def call_sheety_api
    uri = URI("https://api.sheety.co/64faa8a0-2e5a-4892-a49b-071815d157ff")
    body = Net::HTTP.get(uri)
    JSON.parse(body)
  end
end
