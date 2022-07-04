
/// Deep Dive -- Future && Async

Asynchronous-- is as code that runs and might take a bit long and that should not stop 
               other code form continuing.
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

              