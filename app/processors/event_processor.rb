class EventProcessor
  
  def self.process(text)
    message = {  
      "type": "text",
      "text": text
    }
    return message
  end
end
