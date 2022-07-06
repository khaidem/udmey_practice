 

 How Authentication Work

  server -- Auth -- Flutter Mobile App
  
  * This work for WebApp  uses Session --create Session on a server to basically  store an entry on the server in a database for example  that bassically log that user with  a given  ID is Currently  logged in  and   In Front-end, so basically browser also store a cookie which identifies that session.

  *In flutter use Token - Once the user logged in such a token is generated on the server with the certain algorithem and certain private key that only know to the server so that the token can't be faked and the token is the end a very long String which is back to flutter app .

  * So Token is store on the device  not on the server not in the database.This allow us read it form there when the app restart. 