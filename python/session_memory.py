#!/usr/bin/env python3
import argparse, sqlite3, os, json
DB="/opt/openclaw/config/session.db"

def ensure():
    os.makedirs(os.path.dirname(DB), exist_ok=True)
    existed=os.path.exists(DB)
    conn=sqlite3.connect(DB, timeout=5)
    if not existed:
        cur=conn.cursor()
        cur.execute("CREATE TABLE memory (id INTEGER PRIMARY KEY, user TEXT, key TEXT, value TEXT, created_at TEXT, updated_at TEXT)")
        cur.execute("CREATE INDEX idx_user_key ON memory(user, key)")
        conn.commit()
    conn.close()
    try: os.chmod(DB,0o600)
    except: pass

def append(user,command,payload):
    ensure()
    conn=sqlite3.connect(DB, timeout=5)
    cur=conn.cursor()
    now="now"
    cur.execute("INSERT INTO memory (user,key,value,created_at,updated_at) VALUES (?,?,?,?,?)",(user,'reasons',json.dumps({'command':command,'payload':payload}),now,now))
    conn.commit()
    conn.close()

if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument("--user",required=True)
    p.add_argument("--command",required=True)
    p.add_argument("--payload",default="")
    args=p.parse_args()
    append(args.user,args.command,args.payload)
    print("OK")
