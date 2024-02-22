abstract class HomeRepository {
//stream
  Future<List<String>> notifications();
//stream
  Future<List<String>> getUnPaidPenalties();
//stream
  Future<List<String>> getPaidPenalties();

  Future<List<String>> getReport();

  Future<List<String>> getDocuments();
}
