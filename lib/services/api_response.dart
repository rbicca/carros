class ApiResponse<T> {
  bool ok;
  T result;
  int resCode;
  String msg;

  ApiResponse.ok(this.result){
    resCode = 200;
    ok = true;
  }

  ApiResponse.error(this.resCode, this.msg){
    ok = false;
  }

}