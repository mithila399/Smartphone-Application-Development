class Question {
  String questionText;
  List<String> options;
  int correctAnswer;

  Question(this.questionText, this.options, this.correctAnswer);
}

class Quiz {
  List<Question> questions;
  int score = 0;

  Quiz(this.questions);

  void start() {
    for (int i = 0; i < questions.length; i++) {
      var q = questions[i];
      print("\nQ${i + 1}: ${q.questionText}");
      for (int j = 0; j < q.options.length; j++) {
        print("${j + 1}. ${q.options[j]}");
      }

      // Simulate user input (you can replace this with stdin)
      int answer = q.correctAnswer; // assume correct for now
      if (answer == q.correctAnswer) {
        score++;
      }
    }

    print("\nYour final score: $score / ${questions.length}");
  }
}

void main() {
  List<Question> questions = [
    Question("What is the capital of France?", ["Paris", "London", "Berlin"], 1),
    Question("2 + 2 = ?", ["3", "4", "5"], 2),
    Question("What is the color of the sky?", ["Blue", "Green", "Red"], 1),
  ];

  Quiz quiz = Quiz(questions);
  quiz.start();
}
