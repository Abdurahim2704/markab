import 'package:markab/features/home/domain/repository/home_repository.dart';

class HomeService extends HomeRepository {
  @override
  Future<List<String>> getDocuments() async {
    return ["gfhjsdgjh", "shgahgkjhgasjh", "sdhgfjhkgjhsagj"];
  }

  @override
  Future<List<String>> getPaidPenalties() async {
    return ["gfhjsdgjh", "shgahgkjhgasjh", "sdhgfjhkgjhsagj"];
  }

  @override
  Future<List<String>> getReport() async {
    return ["gfhjsdgjh", "shgahgkjhgasjh", "sdhgfjhkgjhsagj"];
  }

  @override
  Future<List<String>> getUnPaidPenalties() async {
    return ["gfhjsdgjh", "shgahgkjhgasjh", "sdhgfjhkgjhsagj"];
  }

  @override
  Future<List<String>> notifications() async {
    return ["gfhjsdgjh", "shgahgkjhgasjh", "sdhgfjhkgjhsagj"];
  }
}
