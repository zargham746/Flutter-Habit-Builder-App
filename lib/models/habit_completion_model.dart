class HabitCompletionModel {
  bool notStarted;
  bool inProgress;
  bool completed;

  HabitCompletionModel({
    this.notStarted = false,
    this.inProgress = false,
    this.completed = false,
  });

  // Helper method to set one option to true and the others to false
  bool setNotStarted() {
    notStarted = true;
    inProgress = false;
    completed = false;
    return notStarted;
  }

  bool setInProgress() {
    notStarted = false;
    inProgress = true;
    completed = false;
    return inProgress;
  }

  bool setCompleted() {
    notStarted = false;
    inProgress = false;
    completed = true;
    return completed;
  }
}
