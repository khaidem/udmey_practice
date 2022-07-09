
/// Deep Dive -- Future && Async

Asynchronous-- is as code that runs and might take a bit long and that should not stop other code form continuing.
  or is a code doesn't wait for it to finish, as it would be the case here for our 
  post request
               
Example:-
               void main(){
                var myFuture = Future((){
                    print('Hello')
                });
                print('This is first run);
                myFuture.then((_) => print('....'))
                // catch error also return future so u can call then after catch error than then will execute if we had no  error. 
                .catchError((error){

                }).then((_) {print('After first then );});
                print('This also run before  the future  is done!');
               }

Cascade notation - is syntactic sugar in Dart that allows you to make a sequence of operations on the same object.    


//Future 

 Is a core class build into Dart which builds an object which generally is a normal object but which give use a method an then method allow us to wait for a certain action to finish or actually it doesn't allow us to wait for that, it doesn't pause our entire app until this is done instead it allow us to define a function that should execute in the future, once action is done.

 //** In Dart toString is available in all Class

 //** Implements Exception  in class - Implements uses a class, it an abstract class.
//** Abstract mean we can't directly instantiate and end in the end when we implements a class , we are signing a contract, we are forced to implements all function.