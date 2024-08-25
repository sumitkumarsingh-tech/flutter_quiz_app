
class QuestionsModel{
  QuestionsModel( this.questions, this.options);

  final String questions;
  final List<String> options;

  List<String> getShuffledOptions(){
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }

}