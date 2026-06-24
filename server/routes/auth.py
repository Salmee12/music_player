from fastapi import  Depends, HTTPException,APIRouter
import bcrypt
import uuid
from sqlalchemy.orm import Session
from models.user import User
from pydantic_schemas.user_create import UserCreate
from database import get_db
from pydantic_schemas.user_login import UserLogin
import jwt

from middleware.auth_middleware import auth_middleware





router = APIRouter()


@router.post("/signup",status_code=201)
def signup_user(user: UserCreate,db: Session=Depends(get_db)):
   
    user_db = db.query(User).filter(User.email == user.email).first()
    
    if  user_db:
        raise HTTPException(400,"User already exists")
        #return  "User already exists"
    
    # Add logic to create the user here
    hashed_pw = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    user_db = User(id=str(uuid.uuid4()),email=user.email, username=user.username, password=hashed_pw)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    return user_db

@router.post("/login")
def login_user(user:UserLogin,db: Session=Depends(get_db)):
    user_db = db.query(User).filter(User.email == user.email).first()
    if not user_db:
        raise HTTPException(400,  "Invalid email or password")
    
    is_match = bcrypt.checkpw(user.password.encode(), user_db.password)
   
    if not is_match:
        raise HTTPException(400, "Invalid email or password")
       
    token = jwt.encode({'id': user_db.id}, 'password_key')
    return {'token': token, 'user': user_db}
    

  
@router.get('/')
def current_user_data(db: Session=Depends(get_db), 
                      user_dict = Depends(auth_middleware)):
    user = db.query(User).filter(User.id == user_dict['uid']).first()##.options( joinedload(User.favorites)  ).first()

    if not user:
        raise HTTPException(404, 'User not found!')
    
    return user



 # To activate the virtual environment in PowerShell, use:

##F:cd "\FlutterProjects\music_player\server"
## .venv\Scripts\Activate.ps1
# uvicorn main:app --host 0.0.0.0 --port 8000
