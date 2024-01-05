export 'config.enum.dart';


class ServiceEnum {
  ServiceEnum._();

  static const int Accounting = 1;
  static const int HRM = 2;
  static const int Hub = 3;
  static const int IAM = 4;
  static const int Inventory = 5;
  static const int Procurement = 6;
  static const int Request = 7;
  static const int Sales = 8;
  static const int Work = 9;
}

class SystemFormEnum {
  SystemFormEnum._();

  static const int Workspace = 0;
  static const int Quotation = 1;
  static const int Lead = 2;
  static const int Order = 3;
  static const int Contract = 4;
  static const int AppBuilder = 6;
  static const int Forum = 8;
  static const int? Work = null;
}

class EditorBlockType {
  EditorBlockType._();

  static const String paragraph = "paragraph";
  static const String delimiter = "delimiter";
  static const String table = "table";
  static const String list = "list";
  static const String quote = "quote";
  static const String divider = "divider";
  static const String image = "image";
  static const String header = "header";
}
