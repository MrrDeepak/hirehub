class Result {
  Preview? preview;

  Result({this.preview});

  Result.fromJson(Map<String, dynamic> json) {
    preview =
        json['preview'] != null ? new Preview.fromJson(json['preview']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.preview != null) {
      data['preview'] = this.preview!.toJson();
    }
    return data;
  }
}

class Preview {
  String? score;
  String? rank;
  String? percentage;
  int? correctAnswer;
  int? incorrectAnswer;
  int? unattemptedQuestions;

  Preview(
      {this.score,
      this.rank,
      this.percentage,
      this.correctAnswer,
      this.incorrectAnswer,
      this.unattemptedQuestions});

  Preview.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    rank = json['rank'];
    percentage = json['percentage'];
    correctAnswer = json['correctAnswer'];
    incorrectAnswer = json['incorrectAnswer'];
    unattemptedQuestions = json['unattemptedQuestions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['rank'] = this.rank;
    data['percentage'] = this.percentage;
    data['correctAnswer'] = this.correctAnswer;
    data['incorrectAnswer'] = this.incorrectAnswer;
    data['unattemptedQuestions'] = this.unattemptedQuestions;
    return data;
  }
}

// class Unattempt {
//   List<UnattemptedQuestions>? unattemptedQuestions;

//   Unattempt({this.unattemptedQuestions});

//   Unattempt.fromJson(Map<String, dynamic> json) {
//     if (json['unattemptedQuestions'] != null) {
//       unattemptedQuestions = <UnattemptedQuestions>[];
//       json['unattemptedQuestions'].forEach((v) {
//         unattemptedQuestions!.add(new UnattemptedQuestions.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.unattemptedQuestions != null) {
//       data['unattemptedQuestions'] =
//           this.unattemptedQuestions!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class UnattemptedQuestions {
  String? questionType;
  String? question;
  List<String>? options;
  int? correctAnswer;
  String? solution;
  String? questionId;

  UnattemptedQuestions(
      {this.questionType,
      this.question,
      this.options,
      this.correctAnswer,
      this.solution,
      this.questionId});

  UnattemptedQuestions.fromJson(Map<String, dynamic> json) {
    questionType = json['questionType'];
    question = json['question'];
    options = json['options'].cast<String>();
    correctAnswer = json['correctAnswer'];
    solution = json['solution'];
    questionId = json['questionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionType'] = this.questionType;
    data['question'] = this.question;
    data['options'] = this.options;
    data['correctAnswer'] = this.correctAnswer;
    data['solution'] = this.solution;
    data['questionId'] = this.questionId;
    return data;
  }
}

// class CorrectAnswer {
//   List<Correct>? correct;

//   CorrectAnswer({this.correct});

//   CorrectAnswer.fromJson(Map<String, dynamic> json) {
//     if (json['correct'] != null) {
//       correct = <Correct>[];
//       json['correct'].forEach((v) {
//         correct!.add(new Correct.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.correct != null) {
//       data['correct'] = this.correct!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Correct {
  String? questionType;
  String? question;
  List<String>? options;
  int? correctAnswer;
  String? solution;
  String? questionId;

  Correct(
      {this.questionType,
      this.question,
      this.options,
      this.correctAnswer,
      this.solution,
      this.questionId});

  Correct.fromJson(Map<String, dynamic> json) {
    questionType = json['questionType'];
    question = json['question'];
    options = json['options'].cast<String>();
    correctAnswer = json['correctAnswer'];
    solution = json['solution'];
    questionId = json['questionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionType'] = this.questionType;
    data['question'] = this.question;
    data['options'] = this.options;
    data['correctAnswer'] = this.correctAnswer;
    data['solution'] = this.solution;
    data['questionId'] = this.questionId;
    return data;
  }
}

// class Incorrect {
//   List<IncorrectFinal>? incorrectFinal;

//   Incorrect({this.incorrectFinal});

//   Incorrect.fromJson(Map<String, dynamic> json) {
//     if (json['incorrectFinal'] != null) {
//       incorrectFinal = <IncorrectFinal>[];
//       json['incorrectFinal'].forEach((v) {
//         incorrectFinal!.add(new IncorrectFinal.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.incorrectFinal != null) {
//       data['incorrectFinal'] =
//           this.incorrectFinal!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class IncorrectFinal {
  String? questionType;
  String? questionId;
  String? question;
  List<String>? options;
  int? answer;
  int? correctAnswer;
  String? solution;

  IncorrectFinal(
      {this.questionType,
      this.questionId,
      this.question,
      this.options,
      this.answer,
      this.correctAnswer,
      this.solution});

  IncorrectFinal.fromJson(Map<String, dynamic> json) {
    questionType = json['questionType'];
    questionId = json['questionId'];
    question = json['question'];
    options = json['options'].cast<String>();
    answer = json['answer'];
    correctAnswer = json['correctAnswer'];
    solution = json['solution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionType'] = this.questionType;
    data['questionId'] = this.questionId;
    data['question'] = this.question;
    data['options'] = this.options;
    data['answer'] = this.answer;
    data['correctAnswer'] = this.correctAnswer;
    data['solution'] = this.solution;
    return data;
  }
}
// class AllAnswers {
//   List<Answers>? answers;

//   AllAnswers({this.answers});

//   AllAnswers.fromJson(Map<String, dynamic> json) {
//     if (json['answers'] != null) {
//       answers = <Answers>[];
//       json['answers'].forEach((v) {
//         answers!.add(new Answers.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.answers != null) {
//       data['answers'] = this.answers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Answers {
  String? questionType;
  String? question;
  List<String>? options;
  int? correctAnswer;
  String? solution;
  String? questionId;

  Answers(
      {this.questionType,
      this.question,
      this.options,
      this.correctAnswer,
      this.solution,
      this.questionId});

  Answers.fromJson(Map<String, dynamic> json) {
    questionType = json['questionType'];
    question = json['question'];
    options = json['options'].cast<String>();
    correctAnswer = json['correctAnswer'];
    solution = json['solution'];
    questionId = json['questionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionType'] = this.questionType;
    data['question'] = this.question;
    data['options'] = this.options;
    data['correctAnswer'] = this.correctAnswer;
    data['solution'] = this.solution;
    data['questionId'] = this.questionId;
    return data;
  }
}