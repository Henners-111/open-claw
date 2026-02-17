#!/usr/bin/env python3
import os, requests
from datetime import datetime
from telegram_sender import send_sync

def get_weather(location='London'):
    try:
        r=requests.get(f'https://wttr.in/{location}?format=%C+%t+%h+%w', timeout=5)
        return r.text.strip()
    except Exception as e:
        return f"Weather error: {e}"

def generate():
    lines=[]
    lines.append(f"🌅 Morning Briefing - {datetime.utcnow().isoformat()}")
    lines.append("Weather: " + get_weather(os.environ.get('WEATHER_LOCATION','London')))
    lines.append("---")
    return "\n".join(lines)

if __name__=='__main__':
    msg=generate()
    print(msg)
    send_sync(msg)
