class RekeningCardSimpananModel {
   String timestamp = '';
   int status = 404;
   String message = '';
   List<Saving> savings = [];
}

class Saving {
   String code;
   String name;
   String balance;
   String productName;

   Saving({
      required this.code,
      required this.name,
      required this.balance,
      required this.productName,
   });
}