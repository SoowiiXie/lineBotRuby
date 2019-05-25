class EventProcessor
  def process(text)
    message = [
      {
        "type": "text",
        "text": "你在一間陰暗的小木屋的床上醒來，身上穿著的是一套不怎麼特別的T恤和長褲。你試著回想你為何會在這裡，但卻甚麼都想不起來。"
      },
      {
        "type": "text",
        "text": "看著陰暗的小木屋，你感到有些不適，希望盡早離開這個房子，便走到了大門，嘗試把門打開。\n門鎖住了。"
      },
      {
        "type": "text",
        "text": "你有些無奈的回到了床邊，突然看見床旁的桌子上有一張紙條和一台電話。\n你將紙條拿了起來。"
      },
      {
        "type": "image",
        "originalContentUrl": "https://11a4a581.ngrok.io/hotel001.jpg",
        "previewImageUrl": "https://11a4a581.ngrok.io/hotel001.jpg"
      },
      {
        "type": "text",
        "text": '"既然如此，先試著打打看電話吧。"你這麼想。
[請輸入電話號碼十位以開啟下一段劇情]
[可以查看"卡片背面"]
[若需重看，請填寫"旅社開門"]'
      },
    ]
    return message
  end
end
