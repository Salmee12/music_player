from fastapi import FastAPI, Request
from pydantic import BaseModel
#from models.base import Base
#from routes import auth, song
#cfrom database import engine

class UserCreate(BaseModel):
    username: str
    email: str
    password: str

app = FastAPI()

#app.include_router(auth.router, prefix='/auth')
#app.include_router(song.router, prefix='/song')

#Base.metadata.create_all(engine)

@app.post("/signup")
def signup_user(user: UserCreate):
    print(user.username, user.email, user.password)
    pass 