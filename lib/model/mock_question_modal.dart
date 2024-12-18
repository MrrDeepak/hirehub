class MockQuestionModal {
  String? testId;
  String? testType;
  String? testName;
  String? duration;
  String? totalMarks;
  String? totalQuestions;
  List<String>? questionTypes;
  List<Questions>? questions;

  MockQuestionModal(
      {this.testId,
      this.testType,
      this.testName,
      this.duration,
      this.totalMarks,
      this.totalQuestions,
      this.questionTypes,
      this.questions});

  MockQuestionModal.fromJson(Map<String, dynamic> json) {
    testId = json['testId'];
    testType = json['testType'];
    testName = json['testName'];
    duration = json['duration'];
    totalMarks = json['totalMarks'];
    totalQuestions = json['totalQuestions'];
    questionTypes = json['questionTypes'].cast<String>();
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['testId'] = this.testId;
    data['testType'] = this.testType;
    data['testName'] = this.testName;
    data['duration'] = this.duration;
    data['totalMarks'] = this.totalMarks;
    data['totalQuestions'] = this.totalQuestions;
    data['questionTypes'] = this.questionTypes;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? question;
  List<String>? options;
  String? questionId;

  Questions({this.question, this.options, this.questionId});

  Questions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = json['options'].cast<String>();
    questionId = json['questionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['options'] = this.options;
    data['questionId'] = this.questionId;
    return data;
  }
}