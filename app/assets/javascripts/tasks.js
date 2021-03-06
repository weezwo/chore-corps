class Task {
  constructor(obj) {
    this.userName = obj["user"]["name"];
    this.dueDate = Date.parse(obj.due_date);
    this.completionDate = Date.parse(obj.completion_date)
    this.completionStatus = obj.completion_status;
  }

  formatDueDate(){
    return moment(this.dueDate).format('MM-DD-YYYY')
  }

  formatCompletionDate(){
    if (this.completionDate) {
      return moment(this.completionDate).format('MM-DD-YYYY')
    } else {
      return "N/A"
    }
  }
}
