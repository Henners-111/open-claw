#!/usr/bin/env python3
import os, asyncio, sys
from telegram import Bot
from telegram.error import TelegramError

async def send_message(message, parse_mode='Markdown'):
    bot_token = os.environ.get('TELEGRAM_BOT_TOKEN')
    chat_id = os.environ.get('TELEGRAM_CHAT_ID')
    if not bot_token or not chat_id:
        print("Telegram token or chat id not set", file=sys.stderr)
        return False
    try:
        bot = Bot(token=bot_token)
        await bot.send_message(chat_id=chat_id, text=message, parse_mode=parse_mode, disable_web_page_preview=True)
        return True
    except TelegramError as e:
        print(f"Telegram error: {e}", file=sys.stderr)
        return False

def send_sync(message):
    return asyncio.run(send_message(message))

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: telegram_sender.py <message>")
        sys.exit(1)
    ok = send_sync(" ".join(sys.argv[1:]))
    sys.exit(0 if ok else 1)
