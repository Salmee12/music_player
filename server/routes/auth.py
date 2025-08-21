from fastapi import  HTTPException,APIRouter
import bcrypt
import uuid
from models.user import User
from pydantic_schemas.user_create import UserCreate
from database import db

router = APIRouter()


@router.post("/signup")
def signup_user(user: UserCreate):
    
    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())
    user_db = db.query(User).filter(User.email == user.email).first()
    
    if  user_db:
        raise HTTPException(400,"User already exists")
        #return  "User already exists"
    
    # Add logic to create the user here
    user_db = User(id=str(uuid.uuid4()),email=user.email, username=user.username, password=hashed_pw)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    return user_db