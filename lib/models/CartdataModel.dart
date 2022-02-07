class CartData{
  var product_id;
  var product_amount;

  CartData({
    required this.product_id,
    required this.product_amount,
  });
CartData.fromJson(Map<String,dynamic> json){
    product_id=json['product_id'];
    product_amount=json['product_amount'];
  }
  Map<String,dynamic> toJson() {
    final Map<String,dynamic> data= new Map<String,dynamic>();
    data['product_id']=this.product_id;
    data['product_amount']=this.product_amount;

    return data;
  }

}