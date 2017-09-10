class Task {
  constructor(obj) {
    this.userName = obj.user.name;
    this.dueDate = Date.parse(obj.due_date);
    this.completionDate = Date.parse(obj.completion_date)
    this.completionStatus = obj.completion_status;
  }
}
