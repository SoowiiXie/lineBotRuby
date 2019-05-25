class EventProcessor
  def process(text)
    where = ["教室","廁所","公園","電影院","餐廳","陽台"].sample
    gender = ["同性", "異性", "男性", "女性"].sample
    who = ["路人", "朋友",  "同學",  "同事",  "老師"].sample
    action = ["說笑話", "深情對視", "告白", "壁咚", "十指相扣"].sample
    return {
      "type": "text",
      "text": "在#{where}對一名#{gender}#{who}#{action}"
    }
  end
end
