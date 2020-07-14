import 'dart:io';

main(){

  new File(r"/Users/soxin/Documents/code_demo/flutter_app_2/lib/test/test1.dart").readAsString().then((value) {
    return value;
  }).then((value) => print(value)).catchError((e){
    print(e);
  });

  print("hahah");
}