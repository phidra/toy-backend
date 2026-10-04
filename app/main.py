from datetime import datetime, timezone
from zoneinfo import ZoneInfo

from fastapi import FastAPI

app = FastAPI(title="Demo Backend")

PARIS_TZ = ZoneInfo("Europe/Paris")


@app.get("/now")
def now():
    return {
        "datetime": datetime.now(PARIS_TZ).isoformat()
    }


@app.get("/nowutc")
def now_utc():
    return {
        "datetime": datetime.now(timezone.utc).isoformat()
    }
